package com.rgonyx.springbootbasic.repository;

import com.rgonyx.springbootbasic.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    // You can add custom queries if needed
}

