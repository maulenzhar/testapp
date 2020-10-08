package com.example.demo.repositories;

import com.example.demo.model.OrderedFood;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepo extends JpaRepository<OrderedFood, Integer> {
}
