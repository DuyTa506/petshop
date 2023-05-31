package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.CartDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    public Optional<CartDetail> findByProduct_IdAndCart_Id(int pId,int cartId);

    @Modifying
    @Query(value = "INSERT INTO cart_detail(product_id,cart_id,quantity) values(:pId,:cId,1)",nativeQuery = true)
    public void addToCart(int pId,int cId);

    @Modifying
    @Query(value = "UPDATE cart_detail set quantity = quantity - 1 where product_id =:pId and cart_id =:cId",nativeQuery = true)
    public void decreaseFromCart(int pId,int cId);

    @Modifying
    @Query(value = "DELETE FROM cart_detail where product_id =:pId and cart_id =:cId",nativeQuery = true)
    public void removeFromCart(int pId,int cId);

    @Modifying
    @Query(value = "DELETE FROM cart_detail where cart_id =:cId",nativeQuery = true)
    public void removeCart(int cId);
}
