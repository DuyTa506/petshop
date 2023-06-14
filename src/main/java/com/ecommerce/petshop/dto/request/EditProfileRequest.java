package com.ecommerce.petshop.dto.request;

import lombok.Data;

@Data
public class EditProfileRequest {
    private Long id;
    private String name;
    private String email;
    private String phone;
    private String gender;
}
