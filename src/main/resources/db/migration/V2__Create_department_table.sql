-- Migration file: db/migration/V2__Create_department_table.sql

-- Step 1: Drop the 'department' table if it exists
DROP TABLE IF EXISTS public.department CASCADE;

-- Step 2: Create the 'department' table
CREATE TABLE public.department (
                                   id BIGSERIAL PRIMARY KEY,
                                   name VARCHAR(255) NOT NULL UNIQUE,  -- Ensure department name is unique
                                   description TEXT,
                                   created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
