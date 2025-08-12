SELECT
    books.name
FROM
    books
    INNER JOIN
        book_sales ON books.id = book_sales.book_id
    INNER JOIN
        stores ON book_sales.store_id = stores.id
GROUP BY
    books.id
    HAVING
        MIN(book_sales.store_id) = MAX(book_sales.store_id)
        AND MIN(book_sales.store_id) = 3
ORDER BY
    books.id ASC;
