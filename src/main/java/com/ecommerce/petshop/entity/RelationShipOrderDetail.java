package com.ecommerce.petshop.entity;

import lombok.AllArgsConstructor;

import java.io.Serializable;
import java.util.Objects;

@AllArgsConstructor
public class RelationShipOrderDetail implements Serializable {
    private Order order;
    private Product product;

    public RelationShipOrderDetail() {
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        RelationShipOrderDetail pk = (RelationShipOrderDetail) o;
        return Objects.equals(order, pk.order) &&
                Objects.equals(product, pk.product);
    }

    @Override
    public int hashCode() {
        return Objects.hash(order, product);
    }
}
