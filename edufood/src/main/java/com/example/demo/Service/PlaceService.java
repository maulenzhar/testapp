package com.example.demo.Service;



import com.example.demo.dto.PlaceDTO;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.model.Place;
import com.example.demo.repositories.PlaceRepo;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class PlaceService {
    PlaceRepo placeRepository;

    public Page<PlaceDTO> getPlaces(Pageable pageable) {
        return placeRepository.findAll(pageable)
                .map(PlaceDTO::from);
    }

    public PlaceDTO getPlace(int id) {
        var place = placeRepository.findById(id).orElseThrow(ResourceNotFoundException::new);
        return PlaceDTO.from(place);
    }

}
