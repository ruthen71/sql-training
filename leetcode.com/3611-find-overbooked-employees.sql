WITH meetings_each_week AS (
    SELECT
        employee_id
        , SUM(duration_hours) AS total_meeting_hours
        , FLOOR(DATEDIFF(meeting_date, '2023-06-12') / 7) AS week_number 
    FROM
        meetings
    GROUP BY
        employee_id
        , week_number
        HAVING
            total_meeting_hours > 20
)
SELECT
    employees.employee_id AS employee_id
    , employees.employee_name AS employee_name
    , employees.department AS department
    , COUNT(week_number) AS meeting_heavy_weeks
FROM
    employees
    INNER JOIN meetings_each_week
        ON employees.employee_id = meetings_each_week.employee_id
GROUP BY
    employees.employee_id
    HAVING
        COUNT(week_number) >= 2
ORDER BY
    meeting_heavy_weeks DESC
    , employee_name ASC
;
