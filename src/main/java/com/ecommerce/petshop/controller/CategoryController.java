package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/categories")
public class CategoryController {
    @Autowired
    CategoryRepository categoryRepository;
    @GetMapping()
    public ResponseEntity getCategories(){
        return ResponseEntity.ok(categoryRepository.findAll());
    }
}
