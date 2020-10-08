package com.example.demo.Service;

import com.example.demo.dto.FoodDTO;
import com.example.demo.model.PlaceFoods;
import com.example.demo.repositories.FoodRepo;
import com.example.demo.repositories.PlaceFoodRepo;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class FoodService {
    private final FoodRepo foodRepository;
    private final PlaceFoodRepo placeFoodRepo;

    public Page<FoodDTO> getFoods(int id, Pageable pageable) {
        return foodRepository.findAllByPlacesId(id, pageable)
                .map(FoodDTO::from);
    }
}
