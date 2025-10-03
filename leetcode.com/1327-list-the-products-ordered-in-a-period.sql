SELECT
    Products.product_name,
    SUM(Orders.unit) AS unit
FROM
    Products
    INNER JOIN Orders
        ON Products.product_id = Orders.product_id
WHERE
    DATE_FORMAT(Orders.order_date, '%Y-%m') = '2020-02'
GROUP BY
    Products.product_id
    HAVING
        SUM(Orders.unit) >= 100
;
