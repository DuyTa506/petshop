package com.ecommerce.petshop.dto.request;

import lombok.Data;

@Data
public class RatingRequest {
    private int customerId;
    private int product;
    private String comment;
    private int rate;

}
