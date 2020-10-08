package com.example.demo.dto;

import com.example.demo.model.Food;
import com.example.demo.model.TypeFood;
import lombok.*;

@Getter
@Setter
@ToString
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class FoodDTO {

    private int id;
    private String name;
    private String image;
    private FoodTypeDTO type;
    private float price;

    public static FoodDTO from(Food food) {
        return builder()
                .id(food.getId())
                .name(food.getName())
                .type(FoodTypeDTO.from(food.getTypeFood()))
                .image(food.getImage())
                .price(food.getPrice())
                .build();
    }

    @Getter
    @Setter
    @ToString
    @Builder(access = AccessLevel.PRIVATE)
    @AllArgsConstructor(access = AccessLevel.PRIVATE)
    @NoArgsConstructor(access = AccessLevel.PRIVATE)
    public static class FoodTypeDTO {
        private int id;
        private String name;
        private String icon;

        public static FoodTypeDTO from(TypeFood foodType) {
            return builder()
                    .id(foodType.getId())
                    .name(foodType.getName())
                //    .icon(foodType.getIcon())
                    .build();
        }
    }
}
