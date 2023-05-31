package com.ecommerce.petshop.dto.request;

import lombok.Data;

@Data
public class SearchProductDTO {
    private String keywords;
    private Integer pageNo;
    private Integer pageSize;
    private Integer sort;
    private Integer category;
    private Integer brand;
}
