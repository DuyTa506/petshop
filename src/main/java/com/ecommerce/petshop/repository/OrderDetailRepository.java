package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail,Long> {
    @Modifying
    @Query(value = "INSERT INTO order_details(order_id,product_id,quantity) Values(:oId,:pId,:qty)",nativeQuery = true)
    public void insertOrderDetails(int oId,int pId,int qty);

    @Query(value = "SELECT sum(o.product.price * o.quantity) from OrderDetail o  where o.product.category.categoryId = :cId")
    public BigDecimal getNumberOfCategoriesSold(int cId);

    @Query(value = "SELECT sum(o.product.price * o.quantity) from OrderDetail o ")
    public BigDecimal getRevenue();

    @Query(value = "SELECT sum(o.quantity) from OrderDetail o  ")
    public Long getNumberOfSoldProduct();
    @Query(value = "SELECT sum(o.product.price * o.quantity) from OrderDetail o  where o.product.brand.brandId = :cId")
    public BigDecimal getNumberOfBrandsSold(int cId);


}
