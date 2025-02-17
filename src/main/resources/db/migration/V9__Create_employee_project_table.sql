-- Migration file: db/migration/V9__Create_employee_project_table.sql

-- Step 1: Drop the 'employee_project' table if it exists
DROP TABLE IF EXISTS public.employee_project CASCADE;

-- Step 2: Create the 'employee_project' table
CREATE TABLE public.employee_project (
                                         employee_id BIGINT REFERENCES public.employee(id) ON DELETE CASCADE,
                                         project_id BIGINT REFERENCES public.project(id) ON DELETE CASCADE,
                                         role VARCHAR(255),
                                         assignment_date DATE,
                                         PRIMARY KEY (employee_id, project_id)
);
