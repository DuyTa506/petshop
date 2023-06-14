package com.ecommerce.petshop.service.interfaces;

import com.ecommerce.petshop.dto.response.DashboardStat;
import com.ecommerce.petshop.entity.Order;

import java.util.List;

public interface OrderService {
    public List<Order> getAllOrderOfCustomer(long id);

    public void cartToOrder(int cartId);

    public DashboardStat getStat();

    public List<Order> getOrderOfCustomer(Long id);

}
