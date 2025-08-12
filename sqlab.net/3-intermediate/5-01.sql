SELECT
    *
FROM
    books
WHERE
    total_page > (
        SELECT
            total_page
        FROM
            books
        WHERE
            name = 'コードと回路'
    );
