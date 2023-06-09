package com.ecommerce.petshop.repository;

import com.ecommerce.petshop.dto.response.POIImageUpdateDTO;
import com.ecommerce.petshop.entity.ProductImage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Optional;

@Repository
public interface ProductImageRepository extends JpaRepository<ProductImage,Long> {
    public Optional<ProductImage> findById(Long id);

    @Modifying
    @Transactional
    @Query(
            value = "DELETE FROM product_image\n" +
                    "WHERE id = ?1",
            nativeQuery = true)
    void deleteImage(long imgId);

    @Modifying
    @Transactional
    @Query(
            value = "INSERT INTO product_image(description, url, product_id) VALUES (?2, ?3, ?1)",
            nativeQuery = true)
    void addImage(long poiId, String description, String url);

    @Query(
            value = "SELECT id as imageId, product_id as poiId, description, url FROM product_image\n" +
                    "WHERE product_id = ?1",
            nativeQuery = true)
    ArrayList<POIImageUpdateDTO> getPOIImagesUpdate(int id);
}
