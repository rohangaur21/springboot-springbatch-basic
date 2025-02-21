-- Create customer table
CREATE TABLE IF NOT EXISTS public.customer
(
    id         BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(100)        NOT NULL,
    last_name  VARCHAR(100)        NOT NULL,
    email      VARCHAR(255) UNIQUE NOT NULL,
    gender     VARCHAR(10),
    contact    VARCHAR(20),
    country    VARCHAR(100),
    dob        VARCHAR(20)
);
