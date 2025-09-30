SELECT
    query_name,
    ROUND(AVG(rating / position), 2) AS quality,
    ROUND(AVG(IF(rating < 3, 100, 0)), 2) AS poor_query_percentage
FROM
    Queries
GROUP BY
    query_name
;
