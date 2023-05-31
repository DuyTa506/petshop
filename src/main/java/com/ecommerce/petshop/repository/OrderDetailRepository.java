package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail,Long> {
    @Modifying
    @Query(value = "INSERT INTO order_details(order_id,product_id,quantity) Values(:oId,:pId,:qty)",nativeQuery = true)
    public void insertOrderDetails(int oId,int pId,int qty);
}
