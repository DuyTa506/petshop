package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.customException.NotEnoughProductQuantityException;
import com.ecommerce.petshop.entity.Cart;
import com.ecommerce.petshop.entity.CartDetail;
import com.ecommerce.petshop.entity.Customer;
import com.ecommerce.petshop.entity.Product;
import com.ecommerce.petshop.repository.CartDetailRepository;
import com.ecommerce.petshop.repository.CartRepository;
import com.ecommerce.petshop.repository.ProductRepository;
import com.ecommerce.petshop.service.interfaces.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartRepository cartRepo;

    @Autowired
    CartDetailRepository cartDetailRepository;

    @Autowired
    ProductRepository productRepository;


    @Override
    public Integer initializeCart(long customerId) {
        Optional<Cart> checkCart = cartRepo.findByCustomer_Id(customerId);
        if (checkCart.isPresent()) {
            return checkCart.get().getId();
        } else {
            Cart cart = new Cart();
            Customer customer = new Customer();
            customer.setId(customerId);
            cart.setCustomer(customer);
            cart = cartRepo.save(cart);
            return cart.getId();
        }
    }

    @Override
    public Cart getCart(long customerId) {
        Optional<Cart> checkCart = cartRepo.findByCustomer_Id(customerId);
        if (checkCart.isPresent()) {
            return checkCart.get();
        }
        return null;
    }

    @Override
    public Cart getCartById(int cId) {
        Optional<Cart> checkCart = cartRepo.findById(cId);
        if(checkCart.isEmpty())
        return null;
        else{
            return checkCart.get();
        }
    }

    @Override
    @Transactional
    public void insertCartDetails(Integer cartId, int productId) throws RuntimeException {
        Optional<Product> checkProduct = Optional.ofNullable(productRepository.findById(productId));
        Optional<Cart> checkCart = cartRepo.findById(cartId);
        if(!checkProduct.isPresent() || !checkCart.isPresent()) {
            throw new RuntimeException("Product not found");
        }
        Optional<CartDetail> checkCartDetails = cartDetailRepository.findByProduct_IdAndCart_Id(productId, cartId);
        if(checkCartDetails.isPresent()) {
            checkCartDetails.get().setQuantity(checkCartDetails.get().getQuantity() + 1);
        }
        else {
            Cart cart = new Cart();
            cart.setId(cartId);
            Product product = new Product();
            product.setId(productId);
            CartDetail cartDetail = new CartDetail();
            cartDetail.setProduct(product);
            cartDetail.setCart(cart);
            cartDetail.setQuantity(1);
            cartDetailRepository.addToCart(productId,cartId);
        }
    }

    @Override
    @Transactional
    public void decreaseCartDetails(Integer cartId, int productId) throws RuntimeException {
        Optional<Product> checkProduct = Optional.ofNullable(productRepository.findById(productId));
        Optional<Cart> checkCart = cartRepo.findById(cartId);
        if(!checkProduct.isPresent() || !checkCart.isPresent()) {
            throw new RuntimeException("Product not found");
        }
        Optional<CartDetail> checkCartDetails = cartDetailRepository.findByProduct_IdAndCart_Id(productId, cartId);
        if(checkCartDetails.isEmpty()) {
            throw new RuntimeException("Product not found");
        }
        else{
            cartDetailRepository.decreaseFromCart(productId,cartId);
        }
    }

    @Override
    @Transactional
    public void removeCartDetails(Integer cartId, int productId) throws RuntimeException {
        Optional<Product> checkProduct = Optional.ofNullable(productRepository.findById(productId));
        Optional<Cart> checkCart = cartRepo.findById(cartId);
        if(!checkProduct.isPresent() || !checkCart.isPresent()) {
            throw new RuntimeException("Product not found");
        }
        Optional<CartDetail> checkCartDetails = cartDetailRepository.findByProduct_IdAndCart_Id(productId, cartId);
        if(checkCartDetails.isEmpty()) {
            throw new RuntimeException("Product not found");
        }
        else{
            cartDetailRepository.removeFromCart(productId, cartId);
        }
    }

    @Override
    @Transactional
    public void checkOut(int cartId) throws NotEnoughProductQuantityException{
        Cart cart = cartRepo.findById(cartId).get();

        for(CartDetail cartItem : cart.getCartDetails()){

            Product p = productRepository.findById(cartItem.getProduct().getId());
            if(p.getStock() < cartItem.getQuantity()){
                throw new NotEnoughProductQuantityException(String.valueOf(p.getId()));
            }
            p.setStock(p.getStock()-cartItem.getQuantity());
            productRepository.save(p);
        }
        cartDetailRepository.removeCart(cart.getId());
    }


}
