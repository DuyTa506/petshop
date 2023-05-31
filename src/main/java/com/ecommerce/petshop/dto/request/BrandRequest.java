package com.ecommerce.petshop.dto.request;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.sql.Date;

@Data
public class BrandRequest {

    private Integer brandId;

    private String brandName;

    private String phone;

    private String email;

    private String address;

}
