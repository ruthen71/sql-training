WITH employee_ids AS (
    SELECT
        employee_id
    FROM
        Employees
    UNION
    SELECT
        employee_id
    FROM
        Salaries
),
valid_employees AS (
    SELECT
        Employees.employee_id AS employee_id
    FROM
        Employees
        INNER JOIN Salaries
            ON Employees.employee_id = Salaries.employee_id
)
SELECT
    employee_id
FROM
    employee_ids
WHERE
    employee_id NOT IN (SELECT employee_id FROM valid_employees)
ORDER BY
    employee_id
;
