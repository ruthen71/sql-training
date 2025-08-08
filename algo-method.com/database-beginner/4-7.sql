
WITH highest_min AS (
    SELECT
        station_id,
        name,
        prefecture,
        highest,
        lowest
    FROM
        temperature_august
    WHERE
        highest = (
            SELECT
                MIN(highest)
            FROM
                temperature_august AS temp_b
            WHERE
                temp_b.prefecture = temperature_august.prefecture
        )
)
SELECT
    *
FROM
    highest_min
GROUP BY
    prefecture
ORDER BY
    highest ASC,
    station_id ASC;
