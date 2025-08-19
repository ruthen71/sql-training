SELECT
    name AS Employee
FROM
    Employee
WHERE
    salary > (
        SELECT
            salary
        FROM
            Employee AS E
        WHERE
            E.id = Employee.managerID
    )
;
