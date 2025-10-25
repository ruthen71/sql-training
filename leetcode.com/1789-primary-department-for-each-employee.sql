WITH employee_multiple_department AS (
    SELECT
        employee_id,
        department_id
    FROM
        Employee
    WHERE
        primary_flag = 'Y'
)
SELECT
    employee_id,
    department_id
FROM
    employee_multiple_department
UNION ALL
SELECT
    employee_id,
    department_id
FROM
    Employee
WHERE
    employee_id NOT IN (SELECT employee_id FROM employee_multiple_department)
;
