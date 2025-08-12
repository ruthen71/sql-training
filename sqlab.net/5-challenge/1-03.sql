SELECT
    stores.name AS name,
    SUM(book_sales_sales.sales) AS sales
FROM
    stores
    INNER JOIN
        (
            SELECT
                id,
                store_id,
                price * figure AS sales
            FROM
                book_sales
        ) AS book_sales_sales
        ON stores.id = book_sales_sales.store_id
GROUP BY
    stores.id
ORDER BY
    name ASC;
