package com.ecommerce.petshop.dto.response;


import lombok.Data;

import java.awt.*;
import java.math.BigDecimal;

@Data
public class PieData {
    private String key;
    private BigDecimal value;
    private Color color;
}
