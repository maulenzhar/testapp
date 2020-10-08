package com.example.demo.controller;


import com.example.demo.model.Food;
import com.example.demo.model.PlaceFoods;
import com.example.demo.model.TypeFood;
import com.example.demo.repositories.FoodRepo;
import com.example.demo.repositories.PlaceFoodRepo;
import com.example.demo.repositories.PlaceRepo;
import com.example.demo.repositories.TypeFoodRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class FoodController {
    @Autowired
    TypeFoodRepo typeFoodRepo;

    @Autowired
    FoodRepo foodRepo;

    @Autowired
    PlaceFoodRepo placeFoodRepo;

    @Autowired
    PlaceRepo placeRepo;


    @RequestMapping("/type")
    public List<TypeFood> gettype(Model model) {
        return typeFoodRepo.findAll();
    }

    @RequestMapping("/food")
    public List<Food> getfood(Model model) {
        return foodRepo.findAll();
    }



    @GetMapping("/place_and_food/search")
    public List<PlaceFoods> getPlaceAndFoodWithName(@RequestParam Optional<String> name){
        return placeFoodRepo.getPlacesFoodsWithNameStartWith(name.orElse(""));
    }
    @GetMapping("/restsearch")
    public List<Food> getFoodWithName(@RequestParam Optional<String> name, Model model){
        return foodRepo.getFoodsWithNameStartWith(name.orElse(""));
    }


}
