SELECT
    IF (
        (SELECT COUNT(DISTINCT salary) FROM Employee) < 2,
        NULL,
        (SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 1)
    ) AS SecondHighestSalary
;
