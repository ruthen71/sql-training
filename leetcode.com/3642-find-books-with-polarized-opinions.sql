SELECT
    books.book_id
    , books.title
    , books.author
    , books.genre
    , books.pages
    , MAX(session_rating) - MIN(session_rating) AS rating_spread
    , ROUND(SUM(IF(session_rating <= 2 OR session_rating >= 4, 1, 0)) / COUNT(session_id), 2) AS polarization_score
FROM
    books
    INNER JOIN reading_sessions
        ON books.book_id = reading_sessions.book_id
GROUP BY
    books.book_id
    HAVING
        MIN(session_rating) <= 2
        AND MAX(session_rating) >= 4
        AND COUNT(session_id) >= 5
        AND polarization_score >= 0.6
ORDER BY
    polarization_score DESC
    , books.title DESC
