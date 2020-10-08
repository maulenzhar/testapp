package com.example.demo.model;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

//@Data
@Entity
@Table(name="ordered_food")
public class OrderedFood {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Getter
    @Column(length = 11)
    private int amount;

    @Getter
    @ManyToOne
    @JoinColumn(name = "orders_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "foods_id")
    private Food foodd;
}
