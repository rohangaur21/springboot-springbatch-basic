-- Migration file: db/migration/V1__Create_employee_table.sql

-- Step 1: Drop the 'employee' table if it exists
DROP TABLE IF EXISTS public.employee CASCADE;

-- Step 2: Create the 'employee' table
CREATE TABLE public.employee (
                                 id BIGSERIAL PRIMARY KEY,
                                 name VARCHAR(255) NOT NULL,
                                 department_id BIGINT REFERENCES public.department(id) ON DELETE SET NULL,  -- Foreign key reference
                                 email VARCHAR(255) UNIQUE,
                                 hire_date DATE NOT NULL,
                                 status_id BIGINT REFERENCES public.employee_status(id) ON DELETE SET NULL,  -- Foreign key reference for status
                                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                 updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create an index on the employee email for fast lookups
CREATE INDEX idx_employee_email ON public.employee(email);

-- Create an index on department for faster filtering
CREATE INDEX idx_employee_department ON public.employee(department_id);
