(
    SELECT
        Users.name AS results
    FROM
        Users
        INNER JOIN MovieRating
            ON Users.user_id = MovieRating.user_id
    GROUP BY
        Users.user_id
    ORDER BY
        COUNT(movie_id) DESC,
        Users.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT
        Movies.title AS results
    FROM
        Movies
        INNER JOIN MovieRating
            ON Movies.movie_id = MovieRating.movie_id
    WHERE
        DATE_FORMAT(MovieRating.created_at, '%Y-%m') = '2020-02'
    GROUP BY
        Movies.movie_id
    ORDER BY
        AVG(MovieRating.rating) DESC,
        Movies.title ASC
    LIMIT 1
)
;
