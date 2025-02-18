package com.rgonyx.springbootbatch.repository;

import com.rgonyx.springbootbatch.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
    // You can add custom queries if needed
}

