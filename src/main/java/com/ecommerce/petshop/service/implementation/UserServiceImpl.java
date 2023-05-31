package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.dto.request.CustomerRequest;
import com.ecommerce.petshop.dto.response.UserDTO;
import com.ecommerce.petshop.entity.Customer;
import com.ecommerce.petshop.entity.Gender;
import com.ecommerce.petshop.entity.Role;
import com.ecommerce.petshop.repository.CustomerRepository;
import com.ecommerce.petshop.service.interfaces.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    CustomerRepository customerRepository;

    @Override
    public List<UserDTO> getAll() {
        List<Customer> all = customerRepository.findAll();

        List<UserDTO> allDTOs = new ArrayList<>();
        for (Customer customer : all) {
            UserDTO dto = new UserDTO();
            dto.setId(customer.getId());
            dto.setUserName(customer.getUserName());
            dto.setName(customer.getName());
            dto.setEmail(customer.getEmail());
            dto.setPhone(customer.getPhone());
            dto.setRole(customer.getRole().getName());
            dto.setAddress(customer.getAddress());
            dto.setGender(customer.getGender());
            dto.setDateOfBirth(customer.getDateOfBirth());
            dto.setDeleted(customer.isDeleted());
            dto.setUpdatedDate(customer.getUpdatedDate());
            dto.setCreatedDate(customer.getCreatedDate());
            allDTOs.add(dto);
        }

         return allDTOs;
    }

    @Override
    public Long addUser(CustomerRequest request) {
        Customer check = customerRepository.findByUserName(request.getUserName());
        if(check != null) {
            throw new NullPointerException("Customer");
        }
        Customer customer = new Customer();
        customer.setName(request.getName());
        customer.setEmail(request.getEmail());
        customer.setPhone(request.getPhone());
        customer.setUserName(request.getUserName());
        customer.setPassword(new BCryptPasswordEncoder().encode(request.getPassword()));
        Role role = new Role();
        role.setId((long) request.getRole());
        customer.setRole(role);
        customer.setAddress(request.getAddress());
        customer.setDateOfBirth(request.getDateOfBirth());
        customer.setGender(Gender.valueOf(request.getGender()));
        customer = customerRepository.save(customer);

        return customer.getId();
    }

    @Override
    public UserDTO getUserById(long id) {
        Optional<Customer> c = customerRepository.findById(id);
        if(c.isPresent()) {
            Customer customer = c.get();
            UserDTO response = new UserDTO();
            response.setName(customer.getName());
            response.setEmail(customer.getEmail());
            response.setPhone(customer.getPhone());
            response.setAddress(customer.getAddress());
            response.setRole(customer.getRole().getName());
            response.setGender(customer.getGender());
            response.setDateOfBirth(customer.getDateOfBirth());
            response.setUserName(customer.getUserName());
            response.setId(customer.getId());
            response.setUpdatedDate(customer.getUpdatedDate());
            response.setCreatedDate(customer.getCreatedDate());
            response.setDeleted(customer.isDeleted());
            return response;
        }
        return null;
    }

    @Override
    public void updateUser(CustomerRequest request) {
        Customer customer = customerRepository.findByUserName(request.getUserName());
        if( customer == null) {
            throw new NullPointerException("Customer");
        }

        customer.setName(request.getName());
        customer.setEmail(request.getEmail());
        customer.setPhone(request.getPhone());
        customer.setUserName(request.getUserName());
        customer.setPassword(new BCryptPasswordEncoder().encode(request.getPassword()));
        Role role = new Role();
        role.setId((long) request.getRole());
        customer.setRole(role);
        customer.setAddress(request.getAddress());
        customer.setDateOfBirth(request.getDateOfBirth());
        customer = customerRepository.save(customer);
        customer.setGender(Gender.valueOf(request.getGender()));
        customerRepository.save(customer);
        return;
    }
}
