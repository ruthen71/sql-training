SELECT
    W1.id AS Id
FROM
    Weather AS W1
    INNER JOIN Weather AS W2
        ON W1.recordDate = W2.recordDate + INTERVAL 1 DAY
WHERE
    W1.temperature > W2.temperature
;
