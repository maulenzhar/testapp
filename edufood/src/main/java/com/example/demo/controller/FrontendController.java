package com.example.demo.controller;

import com.example.demo.Service.CustomerService;
import com.example.demo.Service.FoodService;
import com.example.demo.Service.PlaceService;
import com.example.demo.Service.PropertiesService;
import com.example.demo.model.*;
import com.example.demo.repositories.CustomerRepo;
import com.example.demo.repositories.FoodRepo;
import com.example.demo.repositories.PasswordResetTokenRepo;
import com.example.demo.repositories.PlaceFoodRepo;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.print.attribute.standard.Media;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.*;
import java.security.Principal;
import java.util.*;
import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
@RequestMapping
@AllArgsConstructor
public class FrontendController {
    private final PlaceService placeService;
    private final FoodService foodService;
    @Autowired
    PlaceFoodRepo placeFoodRepo;

    private final PropertiesService propertiesService;
    @Autowired
    FoodRepo foodRepo;

    @Autowired
    CustomerRepo customerRepo;

    PasswordResetTokenRepo passwordResetTokenRepo;

    private final CustomerService customerService;

    private static <T> void constructPageable(Page<T> list, int pageSize, Model model, String uri) {
        if (list.hasNext()) {
            model.addAttribute("nextPageLink", constructPageUri(uri, list.nextPageable().getPageNumber(), list.nextPageable().getPageSize()));
        }

        if (list.hasPrevious()) {
            model.addAttribute("prevPageLink", constructPageUri(uri, list.previousPageable().getPageNumber(), list.previousPageable().getPageSize()));
        }

        model.addAttribute("hasNext", list.hasNext());
        model.addAttribute("hasPrev", list.hasPrevious());
        model.addAttribute("items", list.getContent());
        model.addAttribute("defaultPageSize", pageSize);
    }

    private static String constructPageUri(String uri, int page, int size) {
        return String.format("%s?page=%s&size=%s", uri, page, size);
    }

    @GetMapping
    public String index(Model model, Pageable pageable, HttpServletRequest uriBuilder, Principal principal) {
        var places = placeService.getPlaces(pageable);
        var uri = uriBuilder.getRequestURI();
        try {
            customerService.getByEmail(principal.getName());
            model.addAttribute("dto", customerService.getByEmail(principal.getName()) );
        }catch (NullPointerException e){
            constructPageable(places, propertiesService.getDefaultPageSize(), model, uri);
        }
        constructPageable(places, propertiesService.getDefaultPageSize(), model, uri);
        return "index";
    }

//    @GetMapping("/search")
//    public String getFoodWithName(@RequestParam Optional<String> name, Model model){
//        List listFood = foodRepo.getFoodsWithNameStartWith(name.orElse(""));
//        model.addAttribute("food", listFood);
//        return "search_page";
//    }

    @GetMapping("/search")
    public String getPlaceAndFoodWithName(@RequestParam Optional<String> name, Model model, Principal principal){
        List<PlaceFoods> listFood = placeFoodRepo.getPlacesFoodsWithNameStartWith(name.orElse(""));
        model.addAttribute("food", listFood);
        try {
            var user = customerService.getByEmail(principal.getName());
            model.addAttribute("dto", user);
        }catch(Exception e){}

        return "search_page";
    }

    @GetMapping(value = "/places/{id:\\d+?}", produces = MediaType.IMAGE_JPEG_VALUE)
    public String placePage(@PathVariable int id, Model model,
                            Pageable pageable,
                            HttpServletRequest uriBuilder,
                            Principal principal) {
//        model.addAttribute("place", placeService.getPlace(id));
//        var uri = uriBuilder.getRequestURI();
//        var foods = foodService.getFoods(id, pageable);
//        constructPageable(foods, propertiesService.getDefaultPageSize(), model, uri);


        List<PlaceFoods> listFood = placeFoodRepo.findAllByPlaceId(id);
        model.addAttribute("place", listFood);
        try {
            var user = customerService.getByEmail(principal.getName());
            model.addAttribute("dto", user);
        }catch(Exception e){}
        return "place";
    }

    @GetMapping("/register")
    public String pagereg(Model model){
        if (!model.containsAttribute("form")){
            model.addAttribute("form", new CustomerRegisterForm());
        }
        return "reg";
    }

    @PostMapping("/register")
    public String registerPage(@Valid CustomerRegisterForm customerRequestDto,
                               BindingResult validationResult,
                               RedirectAttributes attributes) {
        attributes.addFlashAttribute("form", customerRequestDto);

        if (validationResult.hasFieldErrors()) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            return "redirect:/register";
        }

        customerService.register(customerRequestDto);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false, defaultValue = "false") Boolean error, Model model) {
        model.addAttribute("error", error);
        return "login";
    }

    @GetMapping("/profile")
    public String pageCustomerProfile(Model model, Principal principal)
    {
        var user = customerService.getByEmail(principal.getName());
        model.addAttribute("dto", user);
        return "profile";
    }

//    @GetMapping("/places/{id:\\d+?}")
//    public String placePage(@PathVariable int id, Model model, Pageable pageable, HttpServletRequest uriBuilder) {
//        model.addAttribute("place", placeService.getPlace(id));
//        var uri = uriBuilder.getRequestURI();
//        var foods = foodService.getFoods(id, pageable);
//        constructPageable(foods, propertiesService.getDefaultPageSize(), model, uri);
//        return "place";
//    }


    @PostMapping("/cart/add")
    public String addToList(@RequestParam String value, HttpSession session) {
        if (session != null) {
            var attr = session.getAttribute(Constants.CART_ID);
            if (attr == null) {
                session.setAttribute(Constants.CART_ID, new ArrayList<String>());
            }
            try {
                var list = (List<String>) session.getAttribute(Constants.CART_ID);
                list.add(value);
            } catch (ClassCastException ignored) {

            }
        }

        return "redirect:/cart";
    }


    @GetMapping("/cart")
    public String cart(Model model, @SessionAttribute(name = Constants.CART_ID, required = false) List<String> cart,Principal principal) {
        if (cart != null) {
            List<Food> foo = new ArrayList<>();
            for (String s : cart){
                for (int i=0; i<foodRepo.findAllById(Collections.singleton(Integer.parseInt(s))).size(); i++){
                    foo.add(foodRepo.findAllById(Collections.singleton(Integer.parseInt(s))).get(i));
                }
                model.addAttribute("listOfFood", foo);
            }
            Map<Food, Long> s =  foo.stream().collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
            model.addAttribute("cartItems", s);
        }

        try {
            var user = customerService.getByEmail(principal.getName());
            model.addAttribute("dto", user);
        }catch(Exception e){}
        return "cart";
    }


    @PostMapping("/cart")
    @ResponseBody
    public boolean addToListRest(@RequestParam String value, @SessionAttribute(name = Constants.CART_ID, required = false) List<String> cart) {
        if (cart != null) {
            cart.add(value);
        }

        return true;
    }

    @PostMapping("/cart/empty")
    public String emptyCart(HttpSession session) {
        session.removeAttribute(Constants.CART_ID);

        return "redirect:/cart";
    }

//================Reset_Pass===========================

    @GetMapping("/forgot-password")
    public String pageForgotPassword(Model model) {
        return "forgot";
    }

    @PostMapping("/forgot-password")
    public String submitForgotPasswordPage(@RequestParam("email") String email,
                                           RedirectAttributes attributes) {

        if (!customerRepo.existsByEmail(email)) {
            attributes.addFlashAttribute("errorText", "Entered email does not exist!");
            return "redirect:/";
        }

        PasswordResetToken pToken = PasswordResetToken.builder()
                .customer(customerRepo.findByEmail(email).get())
                .token(UUID.randomUUID().toString())
                .build();

        passwordResetTokenRepo.deleteAll();
        passwordResetTokenRepo.save(pToken);

        return "redirect:/forgot-success";
    }

    @GetMapping("/forgot-success")
    public String pageResetPassword(Model model) {
        return "forgot-success";
    }

    @PostMapping("/reset-password")
    public String submitResetPasswordPage(@RequestParam("token") String token,
                                          @RequestParam("newPassword") String newPassword,
                                          RedirectAttributes attributes) {

        if (!passwordResetTokenRepo.existsByToken(token)) {
            attributes.addFlashAttribute("errorText", "Entered email does not exist!");
            return "redirect:/reset-password";
        }

        PasswordResetToken pToken = passwordResetTokenRepo.findByToken(token).get();
        Customer customer = customerRepo.findById(pToken.getCustomer().getId()).get();
        customer.setPassword(new BCryptPasswordEncoder().encode(newPassword));

        customerRepo.save(customer);

        return "redirect:/login";
    }
}
