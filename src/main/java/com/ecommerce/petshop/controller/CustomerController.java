package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.config.JwtTokenProvider;
import com.ecommerce.petshop.dto.request.CustomUserDetail;
import com.ecommerce.petshop.dto.request.LoginRequest;
import com.ecommerce.petshop.dto.response.LoginResponse;
import com.ecommerce.petshop.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {


    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenProvider tokenProvider;
    @Autowired
    CustomerRepository customerRepository;

    @GetMapping
    public ResponseEntity getCustomers() {
        return ResponseEntity.ok(customerRepository.findAll());
    }

    @PostMapping("/login")
    public LoginResponse authenticateUser(@RequestBody LoginRequest loginRequest) {

        // Xác thực từ username và password.
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getUserName(),
                        loginRequest.getPassword()
                )
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);

        // Trả về jwt cho người dùng.
        String jwt = tokenProvider.generateToken((CustomUserDetail) authentication.getPrincipal());


        return new LoginResponse(jwt);
    }
}
