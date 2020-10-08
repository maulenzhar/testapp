package com.example.demo.repositories;

import com.example.demo.model.PasswordResetToken;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface PasswordResetTokenRepo extends JpaRepository<PasswordResetToken, Integer> {
    boolean existsByToken(String token);

    void deleteAll();

    Optional<PasswordResetToken> findByToken(String token);
}
