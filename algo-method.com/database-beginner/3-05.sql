WITH
    expenses_three_month_by_category
AS (
    SELECT
        category,
        SUM(amount) AS sum_ammount
    FROM
        expenses_april
    GROUP BY
        category
    UNION ALL
    SELECT
        category,
        SUM(amount) AS sum_ammount
    FROM
        expenses_may
    GROUP BY
        category
    UNION ALL
    SELECT
        category,
        SUM(amount) AS sum_ammount
    FROM
        expenses_june
    GROUP BY
        category
)
SELECT
    category AS "カテゴリ",
    SUM(sum_ammount) AS "支出額"
FROM
    expenses_three_month_by_category
GROUP BY
    category
ORDER BY
    "支出額" DESC;
