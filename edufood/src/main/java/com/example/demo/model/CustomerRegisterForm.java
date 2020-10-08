package com.example.demo.model;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
public class CustomerRegisterForm {

    @NotBlank
    @Email
    private String email = "";

    @Size(min = 4,max = 24,message = "должен быть >=4")
    @Pattern(regexp = "^[^\\d\\s]+$", message = "не число, не пробел")
    private String name = "";

    @Size(min = 4,max = 24,message = "должен быть >=4")
    @Pattern(regexp = "^[^\\d\\s]+$", message = "не число, не пробел")
    private String login = "";

    @Size(min = 4,max = 24,message = "должен быть >=4")
    @Pattern(regexp = "^[^\\d\\s]+$", message = "не число, не пробел")
    private String password = "";
}