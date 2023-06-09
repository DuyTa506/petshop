package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RateRepository extends JpaRepository<Review,Long> {

}
