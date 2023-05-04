package com.ecommerce.petshop.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;
@Data
@Entity
@Table(name = "categories")
public class Category implements Serializable {
    @Id
    @Column(name = "category_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryId;
    @Column(name = "category_name")
    private String categoryName;
    @Column(name = "updated_date")
    @UpdateTimestamp
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    private Date createdDate;
    @Column(name = "is_deleted")
    private boolean isDeleted;


}
