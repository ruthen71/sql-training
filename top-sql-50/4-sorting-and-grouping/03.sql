SELECT
    Sales.product_id,
    Sales.year AS first_year,
    Sales.quantity,
    Sales.price
FROM
    Sales
    INNER JOIN (
        SELECT
            product_id,
            MIN(year) AS min_year
        FROM
            Sales
        GROUP BY
            product_id
    ) AS SalesFirstYear
        ON Sales.product_id = SalesFirstYear.product_id
        AND Sales.year = SalesFirstYear.min_year
WHERE
    SalesFirstYear.min_year IS NOT NULL
;
