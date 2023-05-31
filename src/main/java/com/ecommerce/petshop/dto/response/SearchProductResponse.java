package com.ecommerce.petshop.dto.response;

import com.ecommerce.petshop.entity.Product;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class SearchProductResponse implements Serializable {
    private List<Product> products;
    private int pageNo;
    private int total;
    private int pageSize;
    private int totalPage;

}
