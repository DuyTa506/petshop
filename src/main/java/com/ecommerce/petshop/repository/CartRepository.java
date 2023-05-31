package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CartRepository extends JpaRepository<Cart,Long> {
    public Optional<Cart> findByCustomer_Id(long id);

    public Optional<Cart> findById(int id);
}
