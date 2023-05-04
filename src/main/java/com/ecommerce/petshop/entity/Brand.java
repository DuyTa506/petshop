package com.ecommerce.petshop.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.*;
@Entity
@Data
@Table(name = "brands")
public class Brand implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "brand_id")
    private int brandId;

    @Column(name = "brand_name")
    private String brandName;
    @Column(name = "phone")
    private String phone;
    @Column(name = "email")
    private String email;
    @Column(name = "address")
    private String address;
    @Column(name = "updated_date")
    @UpdateTimestamp
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    private Date createdDate;
    @Column(name = "is_deleted")
    private boolean isDeleted;

}
