SELECT
    release_year,
    COUNT(*) AS "books_num"
FROM
    books
GROUP BY
    release_year
ORDER BY
    "books_num" DESC;
