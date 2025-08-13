SELECT
    Employee.employee_id,
    IFNULL(PrimaryEmployee.department_id, Employee.department_id) AS department_id
FROM
    Employee
    LEFT OUTER JOIN (
        SELECT
            employee_id,
            department_id
        FROM
            Employee
        WHERE
            primary_flag = 'Y'
    ) AS PrimaryEmployee
        ON Employee.employee_id = PrimaryEmployee.employee_id
GROUP BY
    Employee.employee_id
;
