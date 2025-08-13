SELECT
    ROUND(AVG(IF (Activity.event_date IS NOT NULL, 1, 0)), 2) AS fraction
FROM
    (
        SELECT
            player_id AS pid,
            MIN(event_date) AS min_event_date
        FROM
            Activity
        GROUP BY
            player_id
    ) AS A
    LEFT OUTER JOIN Activity
        ON Activity.player_id = A.pid
            AND Activity.event_date = A.min_event_date + INTERVAL 1 DAY
;
