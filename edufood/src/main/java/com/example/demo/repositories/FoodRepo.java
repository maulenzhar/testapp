package com.example.demo.repositories;

import com.example.demo.model.Food;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.stream.DoubleStream;

public interface FoodRepo extends JpaRepository<Food, Integer> {
    //Page<Food> findAllByPlaceId(int id, Pageable pageable);
    @Query("select f from Food  as f" +
            " where f.name like concat(:name, '%')  or f.descriptions like %:name% or f.price = :name ")
    List<Food> getFoodsWithNameStartWith(String name);

    Page<Food> findAll(Pageable pageable);

    Page<Food> findAllByPlacesId(int placeId, Pageable pageable);
}
