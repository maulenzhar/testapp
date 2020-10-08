package com.example.demo.model;

import lombok.Data;
import lombok.Getter;

import javax.persistence.*;
import java.util.List;

//@Data
@Entity
@Table(name="type_foods")
public class TypeFood {

    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Getter
    @Column(length = 128) private String name;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "typeFood")
    @OrderBy("id ASC")
    List<Food> foods;



}
