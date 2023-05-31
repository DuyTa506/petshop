package com.ecommerce.petshop.dto.request;

import com.ecommerce.petshop.entity.Gender;
import com.ecommerce.petshop.entity.Role;
import lombok.Data;

import javax.persistence.*;
import java.sql.Date;

@Data
public class CustomerRequest {

    private String name;

    private String phone;

    private String email;

    private String address;

    private String userName;

    private Date dateOfBirth;

    private String gender;

    private String password;

    private int role;
}
