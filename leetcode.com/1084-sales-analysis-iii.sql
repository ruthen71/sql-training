SELECT
    Product.product_id,
    Product.product_name
FROM
    Product
    INNER JOIN Sales
        ON Product.product_id = Sales.product_id
GROUP BY
    Product.product_id
    HAVING
        date('2019-01-01') <= MIN(Sales.sale_date)
        AND MAX(Sales.sale_date) <= date('2019-03-31')
;
