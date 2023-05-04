package com.ecommerce.petshop.dto.request;

import com.ecommerce.petshop.entity.Brand;
import com.ecommerce.petshop.entity.Category;

import lombok.Data;

import javax.persistence.*;
@Data
public class ProductRequest {

    private String name;

    private String description;

    private double price;

    private int stock;

    private String thumbnailUrl;

    private int categoryId;

    private int brandId;
}
