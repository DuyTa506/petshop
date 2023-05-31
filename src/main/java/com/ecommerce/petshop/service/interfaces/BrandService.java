package com.ecommerce.petshop.service.interfaces;

import com.ecommerce.petshop.dto.request.BrandRequest;
import com.ecommerce.petshop.entity.Brand;

import java.util.List;

public interface BrandService {
    public List<Brand> getBrands();

    public Brand getBrandById(int id);

    public List<Brand> getAllBrands();

    public Integer insertBrand(BrandRequest brand);

    public void editBrand(BrandRequest brand);

    public void deActivateBrand(int id);
}
