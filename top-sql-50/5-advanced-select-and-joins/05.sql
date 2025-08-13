SELECT
    Products.product_id,
    IF (LatestChangeDate.max_change_date IS NOT NULL, Products.new_price, 10) AS price
FROM
    Products
    LEFT OUTER JOIN (
        SELECT
            product_id,
            IF (COUNT(change_date) = 0, NULL, MAX(change_date)) AS max_change_date
        FROM
            Products
        WHERE
            change_date <= '2019-08-16'
        GROUP BY
            product_id
    ) AS LatestChangeDate
        ON Products.product_id = LatestChangeDate.product_id
WHERE
    Products.change_date = LatestChangeDate.max_change_date
    OR LatestChangeDate.max_change_date IS NULL
GROUP BY
    Products.product_id
ORDER BY
    Products.product_id
;
