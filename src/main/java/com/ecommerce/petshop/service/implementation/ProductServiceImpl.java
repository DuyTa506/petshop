package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.dto.request.ProductRequest;
import com.ecommerce.petshop.dto.request.SearchProductDTO;
import com.ecommerce.petshop.dto.response.ReviewDTO;
import com.ecommerce.petshop.dto.response.SearchProductResponse;
import com.ecommerce.petshop.entity.Brand;
import com.ecommerce.petshop.entity.Category;
import com.ecommerce.petshop.entity.Product;
import com.ecommerce.petshop.entity.Review;
import com.ecommerce.petshop.repository.ProductRepository;
import com.ecommerce.petshop.service.interfaces.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository repository;

    @Override
    public Page<Product> getProduct(int pageSize, int pageNumber) {
        return repository.findAll(PageRequest.of(pageNumber, pageSize));
    }

    @Override
    public Page<Product> getProductByKeyword(int pageSize, int pageNumber, String keyword) {
        return repository.findAllByNameContaining(keyword, PageRequest.of(pageNumber, pageSize));
    }

    @Override
    public Page<Product> filterByCategory(int pageSize, int pageNumber, int category_id) {
        return repository.findAllByCategoryCategoryId(category_id, PageRequest.of(pageNumber, pageSize));
    }

    @Override
    public Page<Product> filterByBrand(int pageSize, int pageNumber, int brand) {
        return repository.findAllByBrandBrandId(brand, PageRequest.of(pageNumber, pageSize));
    }

    @Override
    public Product insertProduct(ProductRequest product) {
        Product p = new Product();
        p.setName(product.getName());
        p.setDescription(product.getDescription());
        p.setPrice(product.getPrice());
        Category c = new Category();
        c.setCategoryId(product.getCategoryId());
        p.setCategory(c);
        Brand cb = new Brand();
        cb.setBrandId(product.getBrandId());

        p.setBrand(cb);
        p.setStock(product.getStock());
        p.setThumbnailUrl(product.getThumbnailUrl());
        Product newProduct = repository.save(p);
        return newProduct;
    }

    @Override
    public boolean deleteProduct(int id) {
        if (getProduct(id) == null)
            return false;
        else {
            Product p = getProduct(id);
            p.setDeleted(true);
            repository.save(p);
            return true;
        }
    }

    @Override
    public Product getProduct(int id) {
        return repository.findById(id);
    }

    @Override
    public Product updateProduct(ProductRequest product, int id) {
        Product p = repository.findById(id);
        p.setName(product.getName());
        p.setDescription(product.getDescription());
        p.setPrice(product.getPrice());
        Category c = new Category();
        c.setCategoryId(product.getCategoryId());
        p.setCategory(c);
        Brand cb = new Brand();
        cb.setBrandId(product.getBrandId());

        p.setBrand(cb);
        p.setStock(product.getStock());
        p.setThumbnailUrl(product.getThumbnailUrl());
        Product newProduct = repository.save(p);
        return newProduct;
    }

    @Override
    public List<ReviewDTO> getproductsReviews(int productId) {
        List<Review> reviews = repository.getRatingsByProductId(productId);
        List<ReviewDTO> reviewDTOS = new ArrayList<>();
        if (reviews == null || reviews.isEmpty())
            return null;
        else {
            for (Review review : reviews
            ) {
                ReviewDTO reviewDTO = new ReviewDTO();
                reviewDTO.setReviewId(review.getId());
                reviewDTO.setCreated(review.getDateCreated());
                reviewDTO.setComment(review.getComment());
                reviewDTO.setPId(review.getProduct().getId());
                reviewDTO.setUserId(Math.toIntExact(review.getCustomer().getId()));
                reviewDTO.setUserName(review.getCustomer().getUserName());
                reviewDTO.setRate(review.getRate());
                reviewDTOS.add(reviewDTO);
            }
            return reviewDTOS;
        }
    }

    @Override
    public SearchProductResponse search(SearchProductDTO request) {
        if (request.getPageSize() == null)
            request.setPageSize(9);
        if (request.getPageNo() == null)
            request.setPageNo(0);
        Page<Product> page = repository.search(
                request.getKeywords() == null || request.getKeywords().isEmpty() ? null : request.getKeywords(),
                request.getCategory() == null || request.getCategory().toString().isEmpty() ? null : request.getCategory(),
                request.getBrand() == null || request.getBrand().toString().isEmpty() ? null : request.getBrand(),
                PageRequest.of(request.getPageNo(), request.getPageSize(),
                request.getSort()==null||request.getSort()==0?Sort.by("price").ascending():Sort.by("price").descending()));
        SearchProductResponse response = new SearchProductResponse();
        response.setProducts(page.toList());
        response.setPageSize(request.getPageSize());
        response.setPageNo(request.getPageNo());
        response.setTotal((int) page.getTotalElements());
        response.setTotalPage(page.getTotalPages());
        return response;
    }

    @Override
    public List<Product> getAll() {

        return repository.findAll();
    }

}
