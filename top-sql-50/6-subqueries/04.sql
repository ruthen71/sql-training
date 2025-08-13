SELECT
    visited_on,
    amount,
    ROUND(average_amount, 2) AS average_amount
FROM (
    SELECT
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on ASC
            RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
        ) AS amount,
        AVG(amount) OVER (
            ORDER BY visited_on ASC
            RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
        ) AS average_amount
    FROM (
        SELECT
            visited_on,
            SUM(amount) AS amount
        FROM
            Customer
        GROUP BY
            visited_on
    ) AS C2
) AS C1
WHERE
    C1.visited_on >= (
        SELECT
            MIN(visited_on)
        FROM
            Customer
    ) + INTERVAL 6 DAY
;
