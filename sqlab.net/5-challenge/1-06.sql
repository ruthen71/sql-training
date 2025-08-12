SELECT
    categories.name,
    SUM(book_sales.price * book_sales.figure) AS sales
FROM
    books
    INNER JOIN book_sales
        ON books.id = book_sales.book_id
    INNER JOIN book_categories
        ON books.id = book_categories.book_id
    INNER JOIN categories
        ON book_categories.category_id = categories.id
GROUP BY
    categories.id
ORDER BY
    sales DESC
LIMIT 3;
