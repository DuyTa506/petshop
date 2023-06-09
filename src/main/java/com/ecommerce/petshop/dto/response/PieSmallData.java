package com.ecommerce.petshop.dto.response;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;
@Data
public class PieSmallData {
    private String label;
    private List<BigDecimal> data;
    List<String> backgroundColor;
    private int borderWidth;
}
