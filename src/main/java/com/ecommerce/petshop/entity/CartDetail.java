package com.ecommerce.petshop.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.sql.Date;

@Data
@Entity
@Table(name = "cart_detail")
@IdClass(RelationshipCartDetail.class)
public class CartDetail {
    @Id
    @JsonIgnore
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "cart_id")
    private Cart cart;

    @Id
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name ="quantity")
    private int quantity;

    @Column(name = "updated_date")
    @UpdateTimestamp
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    private Date createdDate;

}
