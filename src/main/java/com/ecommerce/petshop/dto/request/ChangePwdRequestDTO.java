package com.ecommerce.petshop.dto.request;

import lombok.Data;



@Data
public class ChangePwdRequestDTO {

    private Long id;

    private String oldPassword;

    private String newPassword;

    private String confirmPassword;
}
