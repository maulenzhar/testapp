package com.example.demo.controller;

import com.example.demo.Service.CustomerService;
import com.example.demo.Service.PlaceService;
import com.example.demo.dto.PlaceDTO;
import com.example.demo.model.Place;
import com.example.demo.model.PlaceFoods;
import com.example.demo.repositories.PlaceFoodRepo;
import com.example.demo.repositories.PlaceRepo;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;
import java.util.Optional;


@RestController
@RequestMapping("/api/places")
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class PlaceController {
    @Autowired
    private PlaceRepo placeRepo;

    private final PlaceService placeService;

    private final CustomerService customerService;

    @Autowired
    PlaceFoodRepo placeFoodRepo;

    //    @RequestMapping("/places")
//    public List<Place> getplace(Model model) {
//        return placeRepo.findAll();
//    }

//    //http://localhost:8080/places?page=0&size=5&sort=id
//    @RequestMapping(value = "/places", method = RequestMethod.GET)
//    Page<Place> placesPageable(Pageable pageable) {
//        return placeRepo.findAll(pageable);
//
//    }

    @GetMapping
    public List<PlaceDTO> getPlaces(Pageable pageable) {
        return placeService.getPlaces(pageable).getContent();
    }

    @GetMapping("/search_place")
    public List<Place> getPlaceWithName(@RequestParam Optional<String> name){
        return placeRepo.getPlacesWithNameStartWith(name.orElse(""));
    }

    @GetMapping("{id:\\d+?}")
    public List<PlaceFoods> placePage(@PathVariable int id, Model model,
                            Pageable pageable,
                            HttpServletRequest uriBuilder,
                            Principal principal) {
//        model.addAttribute("place", placeService.getPlace(id));
//        var uri = uriBuilder.getRequestURI();
//        var foods = foodService.getFoods(id, pageable);
//        constructPageable(foods, propertiesService.getDefaultPageSize(), model, uri);


//        List<PlaceFoods> listFood = placeFoodRepo.findAllByPlaceId(id);
//        model.addAttribute("place", listFood);
//        try {
//            var user = customerService.getByEmail(principal.getName());
//            model.addAttribute("dto", user);
//        }catch(Exception e){}
        return  placeFoodRepo.findAllByPlaceId(id);
    }
}
