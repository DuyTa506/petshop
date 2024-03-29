package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<Customer,Long> {
    public List<Customer> findAll();
    @Query("SELECT c FROM Customer c WHERE c.userName=:name")
    public Customer findByUserName(@Param("name") String name);
    public Customer findById(int id);

    @Query("select count(c) from Customer c where c.isDeleted = false ")
    public Integer getNumberCustomer();

    @Modifying
    @Transactional
    @Query("UPDATE Customer u SET u.password=:newPassword WHERE u.id=:userId")
    public void updatePassword(Long userId, String newPassword);
}
