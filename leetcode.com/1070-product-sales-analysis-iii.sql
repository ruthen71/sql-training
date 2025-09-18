WITH first_year AS (
    SELECT
        product_id,
        MIN(year) AS min_year
    FROM
        Sales
    GROUP BY
        product_id
)
SELECT
    product_id,
    year AS first_year,
    quantity,
    price
FROM
    Sales
WHERE
    (product_id, year) IN (SELECT * FROM first_year)
;
