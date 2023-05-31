package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.service.interfaces.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/roles")
public class RoleController {
    @Autowired
    RoleService roleService;

    @GetMapping("")
    public ResponseEntity getRoles(){
        return new ResponseEntity(roleService.findAll(), HttpStatus.OK);
    }
}
