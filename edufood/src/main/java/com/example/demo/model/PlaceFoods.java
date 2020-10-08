package com.example.demo.model;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

import javax.persistence.*;

//@Data
@Entity
@Table(name="place_food")
public class PlaceFoods {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Getter
    @ManyToOne
    @JoinColumn(name = "place_id")
    private Place place;

    @Getter
    @ManyToOne
    @JoinColumn(name = "food_id")
    private Food food;
}
