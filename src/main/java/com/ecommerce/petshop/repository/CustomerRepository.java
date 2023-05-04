package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer,Long> {
    public List<Customer> findAll();
    @Query("SELECT c FROM Customer c WHERE c.userName=:name")
    public Customer findByUserName(@Param("name") String name);
    public Customer findById(int id);
}
