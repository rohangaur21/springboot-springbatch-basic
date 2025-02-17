-- Migration file: db/migration/V6__Create_salary_table.sql

-- Step 1: Drop the 'salary' table if it exists
DROP TABLE IF EXISTS public.salary CASCADE;

-- Step 2: Create the 'salary' table
CREATE TABLE public.salary (
                               id BIGSERIAL PRIMARY KEY,
                               employee_id BIGINT REFERENCES public.employee(id) ON DELETE CASCADE,
                               base_salary DECIMAL(10, 2) NOT NULL,
                               bonus DECIMAL(10, 2),
                               effective_date DATE NOT NULL,
                               created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
