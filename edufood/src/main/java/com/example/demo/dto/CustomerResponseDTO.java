package com.example.demo.dto;

import com.example.demo.model.Customer;
import lombok.*;

@Data
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
@Builder(access = AccessLevel.PUBLIC)
public class CustomerResponseDTO {
    private int id;
    private String fullname;
    private String email;

    public static CustomerResponseDTO from(Customer user) {
        return builder()
                .id(user.getId())
                .fullname(user.getName())
                .email(user.getEmail())
                .build();
    }
}