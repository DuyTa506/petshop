package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.repository.OrderDetailRepository;
import com.ecommerce.petshop.service.interfaces.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("/api/orders")
public class OrderController {

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    OrderService orderService;

    @GetMapping("/dashboard")
    public ResponseEntity getNumber() {
        return ResponseEntity.ok(orderService.getStat());
    }
}
