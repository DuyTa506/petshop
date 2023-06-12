package com.ecommerce.petshop.dto;

import lombok.Data;

@Data
public class ChatRequest {
    private  String sender;
    private String message;
}
