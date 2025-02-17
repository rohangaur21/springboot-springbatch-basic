-- Migration file: db/migration/V10__Create_triggers.sql

-- Step 1: Trigger to update the 'updated_at' field when employee table is updated
CREATE OR REPLACE FUNCTION update_employee_timestamp()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Step 2: Create the trigger to update 'updated_at'
CREATE TRIGGER trg_employee_updated_at
    BEFORE UPDATE ON public.employee
    FOR EACH ROW
EXECUTE FUNCTION update_employee_timestamp();
