package com.ecommerce.petshop.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;
@Entity
@Table(name = "product")
@Data
public class Product implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int id;
    @Column(name = "product_name")
    private String name;
    @Column(name = "product_description")
    private String description;
    @Column(name = "price")
    private double price;
    @Column(name = "unit_in_stock")
    private int stock;
    @Column(name = "thumbnail_url")
    private String thumbnailUrl;
    @Column(name = "is_deleted")
    private boolean isDeleted;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "brand_id")
    private Brand brand;
    @Column(name = "updated_date")
    @UpdateTimestamp
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    private Date createdDate;
}
