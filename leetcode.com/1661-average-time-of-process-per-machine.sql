WITH each_processing_time AS (
    SELECT
        machine_id,
        process_id,
        SUM(IF(activity_type = "start", -timestamp, timestamp)) AS processing_time
    FROM
        Activity
    GROUP BY
        machine_id,
        process_id
)
SELECT
    machine_id,
    ROUND(AVG(processing_time), 3) AS processing_time
FROM
    each_processing_time
GROUP BY
    machine_id
;
