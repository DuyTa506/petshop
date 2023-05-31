package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.entity.Cart;
import com.ecommerce.petshop.service.interfaces.CartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    CartService service;

    @PostMapping("/insert-cart")
    public Integer insertCart(@RequestParam(name = "cId") long customerId ){
        return service.initializeCart(customerId);    }

    @GetMapping("/get-cart")
    public ResponseEntity<Cart> getCart(@RequestParam(name ="cId") long customerId){
        Cart cart = service.getCart(customerId);
        if(cart ==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Cart>(cart,HttpStatus.OK);
    }

    @PostMapping("/add-to-cart")
    public ResponseEntity addToCart(@RequestParam(name ="cId") int  cartId,@RequestParam(name ="pId") int pId){
        try {
            service.insertCartDetails(cartId,pId);
            return new ResponseEntity<>(HttpStatus.OK);
        }
        catch (Exception e){
            log.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/decrease-from-cart")
    public ResponseEntity decreaseFromCart(@RequestParam(name ="cId") int  cartId,@RequestParam(name ="pId") int pId){
        try {
            service.decreaseCartDetails(cartId,pId);
            return new ResponseEntity<>(HttpStatus.OK);
        }
        catch (Exception e){
            log.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/remove-from-cart")
    public ResponseEntity removeFromCart(@RequestParam(name ="cId") int  cartId,@RequestParam(name ="pId") int pId){
        try {
            service.removeCartDetails(cartId,pId);
            return new ResponseEntity<>(HttpStatus.OK);
        }
        catch (Exception e){
            log.error(e.getMessage());
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
