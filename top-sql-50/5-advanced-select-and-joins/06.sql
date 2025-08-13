SELECT
    person_name
FROM (
    SELECT
        person_name,
        IF (SUM(weight) OVER (ORDER BY turn) <= 1000, 1, 0) AS over_1000,
        turn
    FROM
        Queue
) AS Q
ORDER BY
    Q.over_1000 DESC,
    Q.turn DESC
LIMIT 1
;
