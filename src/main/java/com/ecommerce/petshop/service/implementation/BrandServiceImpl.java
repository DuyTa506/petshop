package com.ecommerce.petshop.service.implementation;

import com.ecommerce.petshop.dto.request.BrandRequest;
import com.ecommerce.petshop.entity.Brand;
import com.ecommerce.petshop.entity.Product;
import com.ecommerce.petshop.repository.BrandRepository;
import com.ecommerce.petshop.repository.ProductRepository;
import com.ecommerce.petshop.service.interfaces.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BrandServiceImpl implements BrandService {
    @Autowired
    BrandRepository brandRepository;

    @Autowired
    ProductRepository productRepository;
    @Override
    public List<Brand> getBrands() {
        return brandRepository.findAllActive();
    }

    @Override
    public Brand getBrandById(int id) {
        Optional<Brand> brand = brandRepository.findByBrandId(id);
        if(brand.isPresent())
            return brand.get();
        return null;
    }

    @Override
    public List<Brand> getAllBrands() {
        return brandRepository.findAll();
    }

    @Override
    public Integer insertBrand(BrandRequest request) {
        Brand brand = new Brand();
        brand.setBrandName(request.getBrandName());
        brand.setAddress(request.getAddress());
        brand.setEmail(request.getEmail());
        brand.setPhone(request.getPhone());
        brand.setDeleted(false);
        brand = brandRepository.save(brand);
        return brand.getBrandId();
    }

    @Override
    public void editBrand(BrandRequest request) {
        Brand brand = brandRepository.findByBrandId(request.getBrandId()).get();
        brand.setBrandName(request.getBrandName());
        brand.setAddress(request.getAddress());
        brand.setEmail(request.getEmail());
        brand.setPhone(request.getPhone());
        brand.setDeleted(false);
        brandRepository.save(brand);
    }

    @Override
    public void deActivateBrand(int id) {
        Brand brand = brandRepository.findByBrandId(id).get();
        brand.setDeleted(true);
        brandRepository.save(brand);
        List<Product> products = productRepository.findAllByBrandBrandId(id);
        for (Product product : products) {
            product.setDeleted(true);
        }
        productRepository.saveAll(products);
    }
}
