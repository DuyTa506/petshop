package com.ecommerce.petshop.entity;


import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;
@Data
@Entity
@Table(name = "customers")
public class Customer implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "customer_id")
    private Long id;

    @Column(name = "customer_name")
    private String name;
    @Column(name = "phone")
    private String phone;
    @Column(name = "email")
    private String email;
    @Column(name = "address")
    private String address;
    @Column(name = "user_name")
    private String userName;
    @Column(name="date_of_birth")
    private Date dateOfBirth;
    @Column(name = "gender")
    @Enumerated(EnumType.STRING)
    private Gender gender;
    @Column(name = "password")
    private String password;
    @JoinColumn(name = "role_id")
   @ManyToOne(fetch = FetchType.EAGER)
    private Role role;
    @Column(name = "updated_date")
    @UpdateTimestamp
    private Date updatedDate;
    @Column(name = "created_date")
    @CreationTimestamp
    private Date createdDate;
    @Column(name = "is_deleted")
    private boolean isDeleted;
}
