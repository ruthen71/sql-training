SELECT
    books.name
FROM
    book_sales
    INNER JOIN
        books ON book_sales.book_id = books.id
GROUP BY
    books.id
    HAVING
        SUM(book_sales.stock) = 0
ORDER BY
    books.id DESC;
