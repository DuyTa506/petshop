package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order,Long >{
    @Query("Select count(o) from Order o")
    public Integer getOrderCount();

    @Query("Select o from Order o where o.customer.id = :id")
    public List<Order> getOrderByCustomer(Long id);
}
