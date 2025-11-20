WITH sales_by_season AS (
    SELECT
        CASE
            WHEN DATE_FORMAT(sale_date, '%m') IN ('12', '01', '02') THEN 'Winter'
            WHEN DATE_FORMAT(sale_date, '%m') IN ('03', '04', '05') THEN 'Spring'
            WHEN DATE_FORMAT(sale_date, '%m') IN ('06', '07', '08') THEN 'Summer'
            WHEN DATE_FORMAT(sale_date, '%m') IN ('09', '10', '11') THEN 'Fall'
        END AS season,
        category,
        SUM(quantity) AS total_quantity,
        SUM(quantity * price) AS total_revenue
    FROM
        sales
        INNER JOIN products
            ON sales.product_id = products.product_id
    GROUP BY
        season,
        category 
),
sales_order AS (
    SELECT
        season,
        category,
        total_quantity,
        total_revenue,
        ROW_NUMBER() OVER (PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC) AS order_id
    FROM
        sales_by_season
)
SELECT
    season,
    category,
    total_quantity,
    total_revenue
FROM
    sales_order
WHERE
    order_id = 1
ORDER BY
    season
;
