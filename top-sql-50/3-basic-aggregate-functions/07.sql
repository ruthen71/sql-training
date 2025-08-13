SELECT
    ROUND(COUNT((order_date = customer_pref_delivery_date AND cid IS NOT NULL) OR NULL) / COUNT(DISTINCT customer_id) * 100, 2) AS immediate_percentage
FROM
    Delivery
    LEFT OUTER JOIN (
        SELECT
            customer_id AS cid,
            MIN(order_date) AS min_order_date
        FROM
            Delivery
        GROUP BY
            customer_id
    ) AS D
        ON Delivery.customer_id = D.cid
            AND Delivery.order_date = D.min_order_date
;
