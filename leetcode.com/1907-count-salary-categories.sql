WITH accounts_with_salary_category AS (
    SELECT
        account_id,
        IF(income < 20000, "Low Salary", IF(income <= 50000, "Average Salary", "High Salary")) AS category
    FROM
        Accounts
    UNION ALL
    SELECT
        -1 AS account_id,
        "Low Salary" AS category
    UNION ALL
    SELECT
        -1 AS account_id,
        "Average Salary" AS category
    UNION ALL
    SELECT
        -1 AS account_id,
        "High Salary" AS category
)
SELECT
    category,
    SUM(IF(account_id > 0, 1, 0)) AS accounts_count
FROM
    accounts_with_salary_category
GROUP BY
    category
;
