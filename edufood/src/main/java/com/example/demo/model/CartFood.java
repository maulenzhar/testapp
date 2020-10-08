package com.example.demo.model;


import lombok.Getter;

import javax.persistence.*;

@Entity
@Table(name = "cart_food")
public class CartFood {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Getter
    @ManyToOne
    @JoinColumn(name = "food_id")
    private Food food;

    @Getter
    @ManyToOne
    @JoinColumn(name = "cart_id")
    private Cart cart;
}
