WITH borrowing_books AS (
    SELECT
        book_id,
        COUNT(record_id) AS current_borrowers
    FROM
        borrowing_records
    WHERE
        return_date IS NULL
    GROUP BY
        book_id
)
SELECT
    library_books.book_id,
    library_books.title,
    library_books.author,
    library_books.genre,
    library_books.publication_year,
    borrowing_books.current_borrowers
FROM
    library_books
    LEFT OUTER JOIN borrowing_books
        ON library_books.book_id = borrowing_books.book_id
WHERE
    library_books.total_copies = borrowing_books.current_borrowers
ORDER BY
    borrowing_books.current_borrowers DESC,
    library_books.title ASC
;
