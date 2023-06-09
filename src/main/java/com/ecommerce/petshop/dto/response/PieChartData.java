package com.ecommerce.petshop.dto.response;

import lombok.Data;

import java.util.List;

@Data
public class PieChartData {
    List<String> labels;
    List<PieSmallData> datasets;
}
