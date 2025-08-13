SELECT
    Department,
    Employee,
    Salary
FROM (
    SELECT
        D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY D.id
            ORDER BY E.salary DESC
        ) AS salary_rank
    FROM
        Department AS D
        INNER JOIN Employee AS E
            ON D.id = E.departmentId
) AS DE
WHERE
    DE.salary_rank <= 3
;
