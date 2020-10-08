package com.example.demo.controller;

import com.example.demo.Service.CustomerService;
import com.example.demo.model.CustomerRegisterForm;
import com.example.demo.repositories.PlaceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class MainContrller {
    private CustomerService customerService;
    @Autowired
    PlaceRepo placeRepo;

//    @GetMapping
//    public String getMainPage(Model model){
//        model.addAttribute("places", placeRepo.findAll());
//        return "index";
//    }


//    @GetMapping("/login")
//    public String getLogin(){
//        return "login";
//    }



//    @PostMapping("/register")
//    public String regPage(@Valid CustomerRegisterForm form,
//                          BindingResult validRes,
//                          RedirectAttributes attributes){
//
//        attributes.addFlashAttribute("form", form);
//
//        if (validRes.hasFieldErrors()){
//            attributes.addFlashAttribute("errors",validRes.getFieldErrors());
//            return "redirect:/register";
//        }
//        customerService.register(form);
//        return "redirect:/profile";
//    }

//    @GetMapping("/profile")
//    public String getProfile(){
//        return "profile";
//    }

}
