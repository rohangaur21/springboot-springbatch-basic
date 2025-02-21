package com.rgonyx.springbootbatch.controller;

import com.rgonyx.springbootbatch.service.CustomerDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/api/v1/customer")
public class CustomerController {
    @Autowired
    private CustomerDataService customerDataService;

    @GetMapping("/generateData")
    public String generateCustomerData() throws IOException {
        return customerDataService.generateCustomerData();

    }

    @DeleteMapping("/clear")
    public ResponseEntity<Void> clearCustomerData() {
        customerDataService.clear();
        return ResponseEntity.noContent().build();
    }
}
