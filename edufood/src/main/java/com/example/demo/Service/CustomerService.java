package com.example.demo.Service;

import com.example.demo.dto.CustomerResponseDTO;
import com.example.demo.model.Customer;
import com.example.demo.model.CustomerAlreadyRegisteredException;
import com.example.demo.model.CustomerNotFoundException;
import com.example.demo.model.CustomerRegisterForm;
import com.example.demo.repositories.CustomerRepo;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CustomerService {

    private final CustomerRepo repository;
    private final PasswordEncoder encoder;

    public CustomerResponseDTO register(CustomerRegisterForm form) {
        if (repository.existsByEmail(form.getEmail())) {
            throw new CustomerAlreadyRegisteredException();
        }

        var user = Customer.builder()
                .email(form.getEmail())
                .name(form.getName())
                .password(encoder.encode(form.getPassword()))
                .build();

        repository.save(user);

        return CustomerResponseDTO.from(user);
    }

    public CustomerResponseDTO getByEmail(String email) {
        var user = repository.findByEmail(email)
                .orElseThrow(CustomerNotFoundException::new);

        return CustomerResponseDTO.from(user);
    }
}
