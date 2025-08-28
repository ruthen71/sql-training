SELECT
    ROUND(COUNT(DISTINCT A1.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
    Activity AS A1
    INNER JOIN Activity AS A2
        ON A1.player_id = A2.player_id
        AND A1.event_date + INTERVAL 1 DAY = A2.event_date
WHERE
    (A1.player_id, A1.event_date) IN (
        SELECT
            player_id,
            MIN(event_date)
        FROM
            Activity
        GROUP BY
            player_id
    )
;
