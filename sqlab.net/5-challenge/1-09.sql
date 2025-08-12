SELECT
    books.name
FROM
    books
    INNER JOIN book_authors
        ON books.id = book_authors.book_id
    INNER JOIN authors
        ON book_authors.author_id = authors.id
WHERE
    (books.name LIKE '%宇宙%' OR books.name LIKE '%星%')
    AND authors.gender = '女性';
