SELECT
    books.name,
    book_sales.price,
    book_sales.price * 0.1 AS tax
FROM
    book_sales
    INNER JOIN
        books ON book_sales.book_id = books.id;
