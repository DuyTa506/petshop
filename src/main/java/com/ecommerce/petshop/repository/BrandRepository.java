package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Brand;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BrandRepository extends JpaRepository<Brand,Long> {

    Optional<Brand> findByBrandId(int brandId);

    @Query("Select b from Brand b where b.isDeleted = 0")
    public List<Brand> findAllActive();
}
