SELECT
    *
FROM
    books
WHERE
    release_year IN (
        SELECT
            release_year
        FROM
            books
        WHERE
            name IN ('時短レシピ100', 'かもめ飛行')
    );
