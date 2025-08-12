SELECT
    categories.name AS "name",
    COUNT(books.id) AS "num"
FROM
    book_categories
    INNER JOIN books
        ON book_categories.book_id = books.id
    INNER JOIN categories
        ON book_categories.category_id = categories.id
GROUP BY
    categories.name
ORDER BY
    COUNT(books.id) DESC,
    categories.name ASC
LIMIT 3;
