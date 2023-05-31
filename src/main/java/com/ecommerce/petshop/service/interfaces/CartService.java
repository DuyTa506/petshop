package com.ecommerce.petshop.service.interfaces;

import com.ecommerce.petshop.customException.NotEnoughProductQuantityException;
import com.ecommerce.petshop.entity.Cart;

public interface CartService {
    public Integer initializeCart(long customerId);

    public Cart getCart(long customerId);
    public Cart getCartById(int cId);
    public void insertCartDetails(Integer cartId, int productId) throws RuntimeException;

    public void decreaseCartDetails(Integer cartId, int productId) throws RuntimeException;

    public void removeCartDetails(Integer cartId, int productId) throws RuntimeException;

    public void checkOut(int cartId) throws NotEnoughProductQuantityException;
}
