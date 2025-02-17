-- Migration file: db/migration/V5__Create_address_table.sql

-- Step 1: Drop the 'address' table if it exists
DROP TABLE IF EXISTS public.address CASCADE;

-- Step 2: Create the 'address' table
CREATE TABLE public.address (
                                id BIGSERIAL PRIMARY KEY,
                                employee_id BIGINT REFERENCES public.employee(id) ON DELETE CASCADE,
                                address_line1 VARCHAR(255) NOT NULL,
                                address_line2 VARCHAR(255),
                                city VARCHAR(100) NOT NULL,
                                state VARCHAR(50) NOT NULL,
                                zip_code VARCHAR(20) NOT NULL,
                                country VARCHAR(100) NOT NULL,
                                address_type VARCHAR(50)  -- Home, Work, etc.
);
