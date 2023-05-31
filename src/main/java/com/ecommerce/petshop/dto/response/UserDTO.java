package com.ecommerce.petshop.dto.response;

import com.ecommerce.petshop.entity.Gender;
import com.ecommerce.petshop.entity.Role;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Date;

@Data
public class UserDTO {
    private Long id;
    private String name;
    private String phone;
    private String email;
    private String address;
    private String userName;
    private Date dateOfBirth;
    private Gender gender;
    private String role;
    private Date updatedDate;
    private Date createdDate;
    private boolean isDeleted;
}
