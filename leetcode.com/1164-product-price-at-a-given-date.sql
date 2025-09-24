WITH recent_change_date AS (
    SELECT
        product_id,
        MAX(change_date) AS change_date
    FROM
        Products
    WHERE
        change_date <= date('2019-08-16')
    GROUP BY
        product_id
)
SELECT
    product_id,
    new_price AS price
FROM
    Products
WHERE
    (product_id, change_date) IN (SELECT * FROM recent_change_date)
UNION
SELECT
    DISTINCT product_id,
    10 AS price
FROM
    Products
WHERE
    (product_id) NOT IN (SELECT product_id FROM recent_change_date)
;
