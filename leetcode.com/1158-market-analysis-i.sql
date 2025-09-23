WITH orders_in_2019 AS (
    SELECT
        buyer_id
    FROM
        Orders
    WHERE
        order_date >= date('2019-01-01')
        AND order_date <= date('2019-12-31')
)
SELECT
    Users.user_id AS buyer_id,
    Users.join_date,
    SUM(IF(orders_in_2019.buyer_id IS NOT NULL, 1, 0)) AS orders_in_2019
FROM
    Users
    LEFT OUTER JOIN orders_in_2019
        ON Users.user_id = orders_in_2019.buyer_id
GROUP BY
    user_id
;
