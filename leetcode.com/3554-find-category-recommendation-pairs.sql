WITH categories AS (
    SELECT
        DISTINCT category AS category
    FROM
        ProductInfo
),
category_pairs AS (
    SELECT
        c1.category AS category1,
        c2.category AS category2
    FROM
        categories AS c1
        INNER JOIN categories AS c2
            ON c1.category < c2.category
),
user_purchased_categories AS (
    SELECT
        user_id,
        category
    FROM
        ProductPurchases
        INNER JOIN ProductInfo
            ON ProductPurchases.product_id = ProductInfo.product_id
    GROUP BY
        user_id,
        category
)
SELECT
    category1,
    category2,
    COUNT(upc1.user_id) AS customer_count
FROM
    category_pairs
    INNER JOIN user_purchased_categories AS upc1
        ON category_pairs.category1 = upc1.category
    INNER JOIN user_purchased_categories AS upc2
        ON category_pairs.category2 = upc2.category
            AND upc1.user_id = upc2.user_id
GROUP BY
    category1,
    category2
    HAVING
        customer_count >= 3
ORDER BY
    customer_count DESC,
    category1 ASC,
    category2 ASC
;
