package com.ecommerce.petshop.dto.response;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class DashboardStat {
    private int numberOfCustomers;
    private int numberOfOrders;
    private int numberOfSoldProducts;
    private BigDecimal revenue;
    List<PieData> categories;
    List<PieData> brands;
    PieChartData brand;
    PieChartData category;
}
