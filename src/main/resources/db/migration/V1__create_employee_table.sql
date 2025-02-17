-- db/migration/V1__Create_employee_table.sql

CREATE TABLE public.employee (
                          id BIGSERIAL PRIMARY KEY,
                          name VARCHAR(255),
                          department VARCHAR(255)
);
