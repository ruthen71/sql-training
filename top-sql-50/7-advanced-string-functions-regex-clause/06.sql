SELECT
    Products.product_name,
    SUM(IF (DATE_FORMAT(O.order_date, '%Y-%m') = '2020-02', O.unit, 0)) AS unit
FROM
    Products
    INNER JOIN Orders AS O
        ON Products.product_id = O.product_id
GROUP BY
    Products.product_id
    HAVING unit >= 100
;
