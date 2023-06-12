package com.ecommerce.petshop.dto.response;

import lombok.Data;

@Data
public class ChatResponse {
    private String recipient_id;
    private String text;
}
