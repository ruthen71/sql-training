SELECT
    books.name AS book_name,
    authors.name AS author_name
FROM
    book_authors
    INNER JOIN books ON book_authors.book_id = books.id
    INNER JOIN authors ON book_authors.author_id = authors.id;
