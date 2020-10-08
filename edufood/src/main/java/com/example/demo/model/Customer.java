package com.example.demo.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@Table(name="customers")
public class Customer {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Getter
    @Column(length = 128) private String name;

    @Email
    @NotBlank
    @Size(min = 1, max = 128)
    @Getter
    @Column(length = 128)
    private String email;

    @Getter
    @Setter
    @NotBlank
    @Size(min = 1, max = 128)
    @Column(length = 128)
    private String password;


    @Column
    @Builder.Default
    private boolean enabled = true;

    @NotBlank
    @Size(min = 1, max = 128)
    @Column(length = 128)
    @Builder.Default
    private String role = "USER";


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "cart_id", referencedColumnName = "id")
    private Cart cartt;

//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
//    @OrderBy("id ASC")
//    List<Order> orders;


}
