package com.example.demo.repositories;

import com.example.demo.model.Cart;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepo extends JpaRepository<Cart, Integer> {
}
