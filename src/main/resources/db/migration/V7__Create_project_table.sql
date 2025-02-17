-- Migration file: db/migration/V7__Create_project_table.sql

-- Step 1: Drop the 'project' table if it exists
DROP TABLE IF EXISTS public.project CASCADE;

-- Step 2: Create the 'project' table
CREATE TABLE public.project (
                                id BIGSERIAL PRIMARY KEY,
                                name VARCHAR(255) NOT NULL,
                                description TEXT,
                                start_date DATE,
                                end_date DATE,
                                created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
