package com.example.demo.model;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

//@Builder
@AllArgsConstructor(access = AccessLevel.PACKAGE) @NoArgsConstructor
@Entity
@Table(name="foods")
public class Food {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Getter
    @Column(length = 128) private String name;

    @Getter
    @Column(length = 128) private String image;

    @Getter
    @Column(length = 128) private String descriptions;

    @Getter
    @Column(length = 11) private Integer price;

    @Getter
    @ManyToOne
    @JoinColumn(name = "type_foods_id")
    public TypeFood typeFood;



    @OneToMany(fetch = FetchType.LAZY, mappedBy = "food")
    @OrderBy("id ASC")
    List<PlaceFoods> places;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "foodd")
    @OrderBy("id ASC")
    List<OrderedFood> orderedFoods;


    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true,
            targetEntity = CartFood.class, mappedBy = "food")
    List<CartFood> cartItems = new ArrayList<>(0);


    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", descriptions='" + descriptions + '\'' +
                ", price=" + price +
                '}';
    }
}
