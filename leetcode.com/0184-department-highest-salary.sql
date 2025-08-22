WITH max_salaries AS (
    SELECT
        departmentId,
        MAX(salary) AS max_salary
    FROM
        Employee
    GROUP BY
        departmentId
)
SELECT
    Department.name AS Department,
    Employee.name AS Employee,
    Employee.salary AS Salary
FROM
    Employee
    INNER JOIN Department
        ON Employee.departmentId = Department.id
    INNER JOIN max_salaries
        ON Employee.departmentId = max_salaries.departmentId
WHERE
    Employee.salary = max_salaries.max_salary
;
