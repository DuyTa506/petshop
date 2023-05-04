package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.dto.request.ProductRequest;
import com.ecommerce.petshop.repository.ProductRepository;
import com.ecommerce.petshop.service.interfaces.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/products")
public class ProductController {
    @Autowired
    private ProductService service;
    @GetMapping
    public ResponseEntity getProducts(@RequestHeader int page, @RequestHeader int size){
        return ResponseEntity.ok(service.getProduct(size, page).toList());
    }
    @GetMapping("/search")
    public ResponseEntity searchProducts(@RequestHeader int page, @RequestHeader int size,@RequestHeader String key){
        return ResponseEntity.ok(service.getProductByKeyword(size,page, key));
    }
    @GetMapping("/filter/category")
    public ResponseEntity filterProductsByCategory(@RequestHeader int page, @RequestHeader int size,@RequestHeader int category){
        return ResponseEntity.ok(service.filterByCategory(size, page,category));
    }
    @GetMapping("/filter/brand")
    public ResponseEntity filterProductsByBrandư(@RequestHeader int page, @RequestHeader int size,@RequestHeader int brand){
        return ResponseEntity.ok(service.filterByBrand(size, page,brand));
    }
    @PostMapping("/insert")
    public ResponseEntity insertProduct(@RequestBody ProductRequest product){
        return ResponseEntity.ok(service.insertProduct(product));
    }
    @DeleteMapping("/delete")
    public ResponseEntity deleteProduct(@RequestHeader int id){
        return ResponseEntity.ok(service.deleteProduct(id));
    }
    @GetMapping("/get")
    public ResponseEntity getProduct(@RequestHeader int id){
        return ResponseEntity.ok(service.getProduct(id));
    }
    @PutMapping("/update")
    public ResponseEntity updateProduct(@RequestBody ProductRequest product,@RequestBody int id){
        return ResponseEntity.ok(service.updateProduct(product,id));
    }
}
