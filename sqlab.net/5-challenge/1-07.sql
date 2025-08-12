SELECT
    authors.name,
    COUNT(books.id) AS published_title_num
FROM
    books
    INNER JOIN book_authors
        ON books.id = book_authors.book_id
    INNER JOIN authors
        ON book_authors.author_id = authors.id
GROUP BY
    authors.id
ORDER BY
    published_title_num DESC,
    authors.name ASC
LIMIT 3;
