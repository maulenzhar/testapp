package com.example.demo.dto;


import com.example.demo.model.Place;
import lombok.*;

@Getter
@Setter
@ToString
@Builder(access = AccessLevel.PUBLIC)
@AllArgsConstructor(access = AccessLevel.PUBLIC)
@NoArgsConstructor(access = AccessLevel.PUBLIC)
public class PlaceDTO {
    private Integer id;
    private String name;
    private String imagePath;

    public static PlaceDTO from(Place place) {
        return builder()
                .id(place.getId())
                .name(place.getName())
                .imagePath(place.getImage())
                .build();
    }

}
