package com.ecommerce.petshop.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Table(name="reviews")
@Data
@Entity
public class Review {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="review_id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    @ManyToOne
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    @JoinColumn(name = "rate")
    private int rate;

    @JoinColumn(name = "comment",columnDefinition = "text")
    private String Comment;

    @Column(name="date_created")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date dateCreated;

    @Column(name="is_deleted")
    private boolean isDeleted;

    @Column(name="date_modified")
    @Temporal(TemporalType.TIMESTAMP)
    @UpdateTimestamp
    private Date dateModified;
}
