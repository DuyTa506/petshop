package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.entity.Cart;
import com.ecommerce.petshop.entity.CartDetail;
import com.ecommerce.petshop.entity.Order;
import com.ecommerce.petshop.entity.OrderDetail;
import com.ecommerce.petshop.repository.OrderDetailRepository;
import com.ecommerce.petshop.repository.OrderRepository;
import com.ecommerce.petshop.service.interfaces.CartService;
import com.ecommerce.petshop.service.interfaces.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderDetailRepository orderDetailRepository;

    @Autowired
    CartService cartService;

    @Override
    public List<Order> getAllOrderOfCustomer(long id) {
        return null;
    }

    @Override
    @Transactional
    public void cartToOrder(int cartId) {
        Cart cart = cartService.getCartById(cartId);
        if(cart == null) {
            return;
        }
        else {
            Order order = new Order();
            order.setCustomer(cart.getCustomer());
            order = orderRepository.save(order);
            for (CartDetail cartDetail : cart.getCartDetails()) {
                orderDetailRepository.insertOrderDetails(order.getId(),cartDetail.getProduct().getId(),cartDetail.getQuantity());
            }
        }
    }
}
