package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.dto.request.BrandRequest;
import com.ecommerce.petshop.service.interfaces.BrandService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/brand")
public class BrandController {
    @Autowired
    BrandService brandService;

    @GetMapping()
    public ResponseEntity getActiveBrands() {
        return new ResponseEntity(brandService.getBrands(), HttpStatus.OK);
    }

    @GetMapping("/all")
    public ResponseEntity getAllBrands() {
        return new ResponseEntity(brandService.getAllBrands(), HttpStatus.OK);
    }

    @GetMapping("/get-by-id")
    public ResponseEntity getbyId(@RequestParam int id) {
        return new ResponseEntity(brandService.getBrandById(id), HttpStatus.OK);
    }

    @PostMapping("/insert")
    public ResponseEntity insert(@RequestBody BrandRequest request) {
        return new ResponseEntity(brandService.insertBrand(request), HttpStatus.OK);
    }

    @PutMapping("/update")
    public ResponseEntity update(@RequestBody BrandRequest request) {
        brandService.editBrand(request);
        return new ResponseEntity(HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    public ResponseEntity delete(@RequestParam int id) {
        brandService.deActivateBrand(id);
        return new ResponseEntity(HttpStatus.OK);
    }
}
