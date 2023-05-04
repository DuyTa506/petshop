package com.ecommerce.petshop.service.interfaces;

import com.ecommerce.petshop.dto.request.ProductRequest;
import com.ecommerce.petshop.entity.Product;
import org.springframework.data.domain.Page;

public interface ProductService {
    public Page<Product> getProduct(int pageSize, int pageNumber);
    public Page<Product> getProductByKeyword(int pageSize, int pageNumber,String keyword);


    public Page<Product> filterByCategory(int size, int page, int category_id);

    public Page<Product> filterByBrand(int size, int page, int brand);

    Product insertProduct(ProductRequest product);

    boolean deleteProduct(int id);

    Product getProduct(int id);

    Product updateProduct(ProductRequest product,int id);
}
