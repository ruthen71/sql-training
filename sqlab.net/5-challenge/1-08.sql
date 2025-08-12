SELECT
    books.name
FROM
    books
    INNER JOIN book_categories
        ON books.id = book_categories.book_id
GROUP BY
    books.id
    HAVING
        COUNT(book_categories.category_id) >= 2;
