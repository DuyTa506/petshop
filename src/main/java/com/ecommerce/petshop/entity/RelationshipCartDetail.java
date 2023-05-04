package com.ecommerce.petshop.entity;

import java.io.Serializable;
import java.util.Objects;

public class RelationshipCartDetail implements Serializable {
    private Cart cart;
    private Product product;

    public RelationshipCartDetail(Cart cart, Product product) {
        this.cart = cart;
        this.product = product;
    }

    public RelationshipCartDetail() {
    }

    @Override
    public boolean equals(Object o) {
        if ( this == o ) {
            return true;
        }
        if ( o == null || getClass() != o.getClass() ) {
            return false;
        }
        RelationshipCartDetail pk = (RelationshipCartDetail) o;
        return Objects.equals( cart, pk.cart ) &&
                Objects.equals( product, pk.product );
    }

    @Override
    public int hashCode() {
        return Objects.hash(cart, product );
    }
}

