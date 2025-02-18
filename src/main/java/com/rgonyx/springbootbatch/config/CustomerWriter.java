package com.rgonyx.springbootbatch.config;

import com.rgonyx.springbootbatch.repository.CustomerRepository;
import org.springframework.batch.item.Chunk;
import org.springframework.batch.item.ItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CustomerWriter implements ItemWriter {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void write(Chunk chunk) throws Exception {
        System.out.println("Thread Name :- " + Thread.currentThread().getName());
        customerRepository.saveAll(chunk.getItems());

    }
}
