package com.ecommerce.petshop.dto.response;

import lombok.Data;

@Data
public class LoginResponse {
    private String accessToken;
    private String role;
    private long id;

}
