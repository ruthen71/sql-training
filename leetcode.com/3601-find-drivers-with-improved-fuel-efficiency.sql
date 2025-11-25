WITH target_drivers AS (
    SELECT
        drivers.driver_id AS driver_id
        , drivers.driver_name AS driver_name
        , SUM(IF(DATE_FORMAT(trip_date, '%m') <= '06', distance_km / fuel_consumed, 0)) AS sum_ef_1h
        , SUM(IF(DATE_FORMAT(trip_date, '%m') >= '07', distance_km / fuel_consumed, 0)) AS sum_ef_2h
        , SUM(IF(DATE_FORMAT(trip_date, '%m') <= '06', 1, 0)) AS count_1h
        , SUM(IF(DATE_FORMAT(trip_date, '%m') >= '07', 1, 0)) AS count_2h
    FROM
        drivers
        INNER JOIN trips
            ON drivers.driver_id = trips.driver_id
    GROUP BY
        drivers.driver_id
        HAVING count_1h > 0
            AND count_2h > 0
)
SELECT
    driver_id
    , driver_name
    , ROUND(sum_ef_1h / count_1h, 2) AS first_half_avg
    , ROUND(sum_ef_2h / count_2h, 2) AS second_half_avg
    , ROUND(sum_ef_2h / count_2h - sum_ef_1h / count_1h, 2) AS efficiency_improvement
FROM
    target_drivers
WHERE
    ROUND(sum_ef_2h / count_2h - sum_ef_1h / count_1h, 2) > 0
ORDER BY
    efficiency_improvement DESC
    , driver_name ASC
;
