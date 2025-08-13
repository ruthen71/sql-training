SELECT
    Employees.reports_to AS employee_id,
    Managers.name AS name,
    COUNT(*) AS reports_count,
    ROUND(AVG(Employees.age), 0) AS average_age
FROM
    Employees
    INNER JOIN Employees AS Managers
        ON Employees.reports_to = Managers.employee_id
        AND Employees.reports_to IS NOT NULL
GROUP BY
    Employees.reports_to
ORDER BY
    Employees.reports_to ASC
;
