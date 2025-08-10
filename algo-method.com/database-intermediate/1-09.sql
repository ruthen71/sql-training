SELECT
    *
FROM
    posts
WHERE
    author = (
        SELECT
            author
        FROM
            posts
        WHERE
            faves = (SELECT MAX(faves) FROM posts)
    )
ORDER BY
    date DESC
LIMIT 5;
