WITH amount_per_date AS (
    SELECT
        visited_on AS date,
        SUM(amount) AS amount
    FROM
        Customer
    GROUP BY
        visited_on
),
min_date AS (
    SELECT
        MIN(date) AS date
    FROM
        amount_per_date
),
check_date AS (
    SELECT
        date AS visited_on
    FROM
        amount_per_date
    WHERE
        date - INTERVAL 6 DAY >= (SELECT date FROM min_date)
)
SELECT
    visited_on,
    (
        SELECT
            SUM(amount)
        FROM
            amount_per_date
        WHERE
            date >= visited_on - INTERVAL 6 DAY
            AND date <= visited_on
    ) AS amount,
    (
        SELECT
            ROUND(AVG(amount), 2)
        FROM
            amount_per_date
        WHERE
            date >= visited_on - INTERVAL 6 DAY
            AND date <= visited_on
    ) AS average_amount
FROM
    check_date
;
