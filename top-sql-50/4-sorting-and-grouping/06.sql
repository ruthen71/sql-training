SELECT
    MAX(UniqueNumbers.num) AS num
FROM (
    SELECT
        MAX(num) AS num
    FROM
        MyNumbers
    GROUP BY
        num
        HAVING
            COUNT(*) = 1
) AS UniqueNumbers
;
