package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Product;
import com.ecommerce.petshop.entity.Review;
import org.hibernate.annotations.Parameter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {
    public List<Product> findAll();

    public Page<Product> findAllByNameContaining(@Param("key") String keyName, Pageable pageable);
    public Page<Product> findAllByCategoryCategoryId(@Param("categoryId") int id, Pageable pageable);
    public Page<Product> findAllByBrandBrandId(@Param("brandId") int id, Pageable pageable);
    public Product findById(@Param("productId") int id);

    @Query("select r from Review r join Customer u on r.customer.id = u.id where r.product.id = :id and r.isDeleted=false")
    ArrayList<Review> getRatingsByProductId(int id);

    @Query(value = "Select * from product  where is_deleted = 0 and" +
            "(:keywords is null or product_name like concat('%',:keywords,'%')) " +
            "and (:cId is null or category_id =:cId) " +
            "and (:bId is null or brand_id = :bId)",nativeQuery = true)
    public Page<Product> search(String keywords, Integer cId, Integer bId, Pageable page);


    public List<Product> findAllByBrandBrandId(int id);
}
