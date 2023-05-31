package com.ecommerce.petshop.service.interfaces;

import com.ecommerce.petshop.dto.request.CustomerRequest;
import com.ecommerce.petshop.dto.response.UserDTO;
import com.ecommerce.petshop.entity.Customer;

import java.util.List;

public interface UserService {
    public List<UserDTO> getAll();

    public Long addUser(CustomerRequest request);

    public UserDTO getUserById(long id);

    public void updateUser(CustomerRequest request);

}
