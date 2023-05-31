package com.ecommerce.petshop.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {
    private int rate;
    private Long reviewId;
    private String comment;
    private boolean deleted;
    private Date created;
    private Date modified;
    private int userId;
    private String userName;
    private int pId;
}
