package com.ecommerce.petshop.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.*;
@Entity
@Data
@Table(name = "orders")
public class Order implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    @JsonIgnore
    private Customer customer;

    @Column(name = "updated_date")
    @UpdateTimestamp
    @JsonFormat(pattern = "dd/MM/yyyy")
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    @JsonFormat(pattern = "dd/MM/yyyy")
    private Date createdDate;
    @Column(name = "is_deleted")
    private boolean isDeleted;
    @OneToMany(mappedBy ="order",fetch =FetchType.LAZY)
    List<OrderDetail> orderDetails;
}
