SELECT
    Department.name AS 'Department',
    E1.name AS 'Employee',
    E1.salary AS 'Salary'
FROM
    Employee AS E1
    JOIN Department
        ON E1.departmentId = Department.id
WHERE
    E1.salary >= IFNULL((
        SELECT
            DISTINCT E2.salary AS third_salary
        FROM
            Employee AS E2
        WHERE
            E1.departmentId = E2.departmentId
        ORDER BY
            E2.salary DESC
        LIMIT 1 OFFSET 2
    ), 0)
;
