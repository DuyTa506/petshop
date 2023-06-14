package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.config.JwtTokenProvider;
import com.ecommerce.petshop.dto.request.*;
import com.ecommerce.petshop.dto.response.LoginResponse;
import com.ecommerce.petshop.dto.response.UserDTO;
import com.ecommerce.petshop.entity.Customer;
import com.ecommerce.petshop.repository.CustomerRepository;
import com.ecommerce.petshop.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api/customers")
public class CustomerController {


    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    private JwtTokenProvider tokenProvider;
    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    UserService service;
    @GetMapping
    public ResponseEntity getCustomers() {
        return ResponseEntity.ok(customerRepository.findAll());
    }

    @PostMapping("/login")
    public LoginResponse authenticateUser(@RequestBody LoginRequest loginRequest) {

        // Xác thực từ username và password.
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getUsername(),
                        loginRequest.getPassword()
                )
        );
        SecurityContextHolder.getContext().setAuthentication(authentication);
        // Trả về jwt cho người dùng.
        String jwt = tokenProvider.generateToken((CustomUserDetail) authentication.getPrincipal());
        LoginResponse loginResult = new LoginResponse();
        loginResult.setAccessToken(jwt);
        CustomUserDetail userDTO = (CustomUserDetail) authentication.getPrincipal();
        Customer user = customerRepository.findById(userDTO.getUser().getId()).get();
        loginResult.setRole(user.getRole().getName());
        loginResult.setId(user.getId());

        return loginResult;


    }
    @GetMapping("/getAll")
    public ResponseEntity getAll(){
        return new ResponseEntity(service.getAll(), HttpStatus.OK);
    }

    @PostMapping("/register")
    public ResponseEntity register(@RequestBody CustomerRequest request){
        try{
            Long id = service.addUser(request);
            return new ResponseEntity(HttpStatus.OK);
        }
        catch (NullPointerException e){
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/get-by-id")
    public ResponseEntity getById(@RequestParam long id){
        UserDTO userDTO = service.getUserById(id);
        if(userDTO != null){
            return new ResponseEntity(userDTO,HttpStatus.OK);
        }
        return new ResponseEntity(HttpStatus.NOT_FOUND);
    }

    @PutMapping("/edit")
    public ResponseEntity editUser(@RequestBody CustomerRequest user){
        try{
            service.updateUser(user);
            return new ResponseEntity(HttpStatus.OK);
        }
        catch (NullPointerException e){
            return new ResponseEntity(HttpStatus.NOT_FOUND);
        }

    }
    @PostMapping("/edit-password")
    public ResponseEntity<?> updatePassword(@RequestBody ChangePwdRequestDTO request){
        try{

            if (service.getUserById(request.getId()) == null) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
            boolean result = service.editPassword(request);
            if (result == false){
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            } else {
                return new ResponseEntity<>(HttpStatus.OK);
            }
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/edit-profile")
    public ResponseEntity editProfile(@RequestBody EditProfileRequest request){
        try {
            service.editProfile(request);
            return new ResponseEntity<>(HttpStatus.OK);
        }
        catch (Exception e){
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
