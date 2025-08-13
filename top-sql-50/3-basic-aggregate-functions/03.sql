SELECT
    Project.project_id,
    ROUND(SUM(Employee.experience_years) / COUNT(*), 2) AS average_years
FROM
    Project
    INNER JOIN Employee
        ON Project.employee_id = Employee.employee_id
GROUP BY
    Project.project_id
