package com.ecommerce.petshop.service.interfaces;

import com.ecommerce.petshop.entity.Order;

import java.util.List;

public interface OrderService {
    public List<Order> getAllOrderOfCustomer(long id);

    public void cartToOrder(int cartId);

}
