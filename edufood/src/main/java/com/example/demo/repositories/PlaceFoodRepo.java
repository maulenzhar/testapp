package com.example.demo.repositories;

import com.example.demo.model.Food;
import com.example.demo.model.Place;
import com.example.demo.model.PlaceFoods;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PlaceFoodRepo extends JpaRepository<PlaceFoods, Integer> {
//    select pl.name, f.name from place_food pf
//    left join places pl on pf.place_id=pl.id
//    left join foods f on f.id=pf.food_id
//
//    SELECT e.id FROM employees e LEFT JOIN posts p ON p.owner_id = e.id WHERE p.owner_id IS NULL
//    @Query("SELECT e FROM employees e LEFT JOIN p.posts p ON p.owner_id = e.id WHERE p.owner_id IS NULL")
//    @Query("SELECT pf FROM place_food pf " +
//            "LEFT JOIN places pl ON pl.id = pf.place_id " +
//            "left join foods f on f.id=pf.food_id" +
//            "where pl.name like concat(:name, '%') or f.name like concat(:name, '%')");
@Query("select  pf from PlaceFoods  pf " +
        "left JOIN  Place pl ON pl.id = pf.place.id " +
        "left JOIN  Food f ON f.id = pf.food.id "+
        "where pl.name like concat(:name, '%') or f.name like concat(:name, '%') "+
        "")
      List<PlaceFoods>   getPlacesFoodsWithNameStartWith(String name);


      @Query("select  pf from PlaceFoods  pf " +
              "left JOIN  Place pl ON pl.id = pf.place.id " +
              "left JOIN  Food f ON f.id = pf.food.id "+
              "where pl.id = :placeId "+
              "")
      List<PlaceFoods> findAllByPlaceId(int placeId);




}
