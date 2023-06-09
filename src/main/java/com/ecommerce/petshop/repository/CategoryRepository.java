package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category,Long> {
    public List<Category> findAll();

    @Query("select c from Category c where c.isDeleted = false")
    public List<Category> findByDeletedIsFalse();
}
