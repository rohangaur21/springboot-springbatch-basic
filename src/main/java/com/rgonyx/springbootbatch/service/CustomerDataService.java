package com.rgonyx.springbootbatch.service;

import com.rgonyx.springbootbatch.repository.CustomerRepository;
import com.rgonyx.springbootbatch.util.CustomerDataGeneratorUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class CustomerDataService {

    @Autowired
    private CustomerRepository customerRepository;

    private final CustomerDataGeneratorUtils dataGeneratorUtils;

    public CustomerDataService(CustomerDataGeneratorUtils dataGeneratorUtils) {
        this.dataGeneratorUtils = dataGeneratorUtils;
    }

    public String generateCustomerData() throws IOException {
        // Call the method and get the absolute file path
        return dataGeneratorUtils.generateCustomerData();
    }

    public void clear() {
        customerRepository.deleteAll();
    }
}
