package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Product;
import org.hibernate.annotations.Parameter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {
    public List<Product> findAll();

    public Page<Product> findAllByNameContaining(@Param("key") String keyName, Pageable pageable);
    public Page<Product> findAllByCategoryCategoryId(@Param("categoryId") int id, Pageable pageable);
    public Page<Product> findAllByBrandBrandId(@Param("brandId") int id, Pageable pageable);
    public Product findById(@Param("productId") int id);
}
