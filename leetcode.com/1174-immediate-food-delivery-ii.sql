WITH first_delivery AS (
    SELECT
        customer_id,
        MIN(order_date) AS order_date
    FROM
        Delivery
    GROUP BY
        customer_id
)
SELECT
    ROUND(
        AVG(IF(Delivery.order_date = Delivery.customer_pref_delivery_date, 100, 0)), 
        2
    ) AS immediate_percentage
FROM
    Delivery
    INNER JOIN first_delivery
        ON Delivery.customer_id = first_delivery.customer_id
        AND Delivery.order_date = first_delivery.order_date
;
