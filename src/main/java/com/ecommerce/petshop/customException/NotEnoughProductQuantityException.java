package com.ecommerce.petshop.customException;

public class NotEnoughProductQuantityException extends Exception {
    public NotEnoughProductQuantityException(String messagee) {
        super(messagee);
    }
}
