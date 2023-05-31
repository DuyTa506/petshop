package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.entity.Role;
import com.ecommerce.petshop.repository.RoleRepository;
import com.ecommerce.petshop.service.interfaces.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleRepository roleRepository;

    @Override
    public List<Role> findAll() {
        return roleRepository.findAll();
    }
}
