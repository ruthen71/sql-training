SELECT
    id
FROM
    Weather AS w1
WHERE
    temperature > (
        SELECT
            w2.temperature
        FROM
            Weather AS w2
        WHERE
            w1.recordDate = w2.recordDate + INTERVAL 1 DAY
    );
