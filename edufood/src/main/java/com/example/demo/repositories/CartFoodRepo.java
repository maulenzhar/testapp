package com.example.demo.repositories;

import com.example.demo.model.CartFood;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartFoodRepo extends JpaRepository<CartFood, Integer> {
}
