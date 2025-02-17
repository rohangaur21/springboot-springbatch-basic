-- Migration file: db/migration/V3__Create_employee_status_table.sql

-- Step 1: Drop the 'employee_status' table if it exists
DROP TABLE IF EXISTS public.employee_status CASCADE;

-- Step 2: Create the 'employee_status' table
CREATE TABLE public.employee_status (
                                        id BIGSERIAL PRIMARY KEY,
                                        status_name VARCHAR(50) NOT NULL,  -- For example: Active, Inactive, etc.
                                        description TEXT
);
