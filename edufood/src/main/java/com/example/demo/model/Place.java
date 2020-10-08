package com.example.demo.model;


import lombok.Getter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="places")
public class Place {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Getter
    @Column(length = 128) private String name;

    @Getter
    @Column(length = 128) private String image;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "place")
    @OrderBy("id ASC")
    List<PlaceFoods> places;


}
