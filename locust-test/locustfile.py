from locust import HttpUser, task, between
import json

class EmployeeApiTest(HttpUser):
    wait_time = between(1, 3)  # wait time between requests (1 to 3 seconds)

    # Simulate creating a new employee
    @task(1)
    def create_employee(self):
        response = self.client.post("/api/v1/employees", json={
            "name": "John Doe",
            "position": "Software Engineer",
            "salary": 70000
        })
        if response.status_code == 201:
            print("Employee created successfully")

    # Simulate getting all employees
    @task(2)
    def get_all_employees(self):
        response = self.client.get("/api/v1/employees")
        if response.status_code == 200:
            print("Retrieved all employees")

    # Simulate getting a specific employee by ID
    @task(1)
    def get_employee_by_id(self):
        response = self.client.get("/api/v1/employees/1")
        if response.status_code == 200:
            print("Employee details fetched successfully")

    # Simulate updating an employee
    @task(1)
    def update_employee(self):
        response = self.client.put("/api/v1/employees/1", json={
            "id": 1,
            "name": "John Doe Updated",
            "position": "Senior Software Engineer",
            "salary": 90000
        })
        if response.status_code == 200:
            print("Employee updated successfully")

    # Simulate deleting an employee
    @task(1)
    def delete_employee(self):
        response = self.client.delete("/api/v1/employees/1")
        if response.status_code == 204:
            print("Employee deleted successfully")


# locust -f locustfile.py --host=http://localhost:8081