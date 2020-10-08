package com.example.demo.repositories;

import com.example.demo.model.Place;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PlaceRepo extends JpaRepository<Place, Integer> {
    @Query("select p from Place  as p where  p.name like concat(:name, '%') ")
    List<Place> getPlacesWithNameStartWith(String name);
}
