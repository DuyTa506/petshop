package com.ecommerce.petshop.controller;

import com.ecommerce.petshop.dto.ChatRequest;
import com.ecommerce.petshop.dto.response.ChatResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@RestController
@RequestMapping("/api/chat")
public class ChatController {
    @Autowired
    private RestTemplate restTemplate;

    @PostMapping(value = "/send")
    public ResponseEntity send(@RequestBody ChatRequest request){
        List<ChatResponse> res = restTemplate.postForObject("http://localhost:5005/webhooks/rest/webhook", request, List.class);
       return ResponseEntity.ok(res);
    }
}
