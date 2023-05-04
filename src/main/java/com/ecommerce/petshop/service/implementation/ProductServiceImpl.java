package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.dto.request.ProductRequest;
import com.ecommerce.petshop.entity.Brand;
import com.ecommerce.petshop.entity.Category;
import com.ecommerce.petshop.entity.Product;
import com.ecommerce.petshop.repository.ProductRepository;
import com.ecommerce.petshop.service.interfaces.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository repository;

    @Override
    public Page<Product> getProduct(int pageSize, int pageNumber) {
        return repository.findAll(PageRequest.of(pageNumber,pageSize));
    }

    @Override
    public Page<Product> getProductByKeyword(int pageSize, int pageNumber, String keyword) {
        return repository.findAllByNameContaining(keyword,PageRequest.of(pageNumber,pageSize));
    }

    @Override
    public Page<Product> filterByCategory(int pageSize, int pageNumber, int category_id) {
        return repository.findAllByCategoryCategoryId(category_id,PageRequest.of(pageNumber,pageSize));
    }

    @Override
    public Page<Product> filterByBrand(int pageSize, int pageNumber, int brand) {
        return repository.findAllByBrandBrandId(brand,PageRequest.of(pageNumber,pageSize));
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
        Product newProduct= repository.save(p);
        return newProduct;
    }

    @Override
    public boolean deleteProduct(int id) {
        if(getProduct(id) == null)
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
    public Product updateProduct(ProductRequest product,int id) {
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
        Product newProduct= repository.save(p);
        return newProduct;
    }

}
