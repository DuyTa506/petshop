package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.dto.request.CustomUserDetail;
import com.ecommerce.petshop.entity.Customer;
import com.ecommerce.petshop.repository.CustomerRepository;
import com.ecommerce.petshop.service.interfaces.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements UserDetailsService
{
    @Autowired
    private CustomerRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) {
        // Kiểm tra xem user có tồn tại trong database không?
        Customer user = userRepository.findByUserName(username);
        if (user == null) {
            throw new UsernameNotFoundException(username);
        }
        return new CustomUserDetail(user);
    }


    public UserDetails loadUserById(Long userId) {
        return new CustomUserDetail(userRepository.findById(userId).get());
    }
}
