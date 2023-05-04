package com.ecommerce.petshop.entity;


import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Date;
import java.util.List;

import javax.persistence.*;
@Entity
@Data
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @Column(name = "updated_date")
    @UpdateTimestamp
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    private Date createdDate;
    @Column(name = "is_deleted")
    private boolean isDeleted;
    @OneToMany(mappedBy ="order",fetch =FetchType.LAZY)
    List<OrderDetail> orderDetails;
}
