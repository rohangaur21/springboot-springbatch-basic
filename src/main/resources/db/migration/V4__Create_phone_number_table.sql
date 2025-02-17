-- Migration file: db/migration/V4__Create_phone_number_table.sql

-- Step 1: Drop the 'phone_number' table if it exists
DROP TABLE IF EXISTS public.phone_number CASCADE;

-- Step 2: Create the 'phone_number' table
CREATE TABLE public.phone_number (
                                     id BIGSERIAL PRIMARY KEY,
                                     employee_id BIGINT REFERENCES public.employee(id) ON DELETE CASCADE,
                                     phone_number VARCHAR(50) NOT NULL,
                                     phone_type VARCHAR(50)  -- Mobile, Home, Work, etc.
);
