WITH InsuranceAfterCond1 AS (
    SELECT
        I1.pid,
        I1.tiv_2016,
        I1.lat,
        I1.lon
    FROM
        Insurance AS I1
        LEFT OUTER JOIN Insurance AS I2
            ON I1.tiv_2015 = I2.tiv_2015
            AND I1.pid != I2.pid
    WHERE
        I2.pid IS NOT NULL
    GROUP BY
        I1.pid
),
InsuranceAfterCond2 AS (
    SELECT
        1 AS collect_id,
        IC1.tiv_2016
    FROM
        InsuranceAfterCond1 AS IC1
        LEFT OUTER JOIN Insurance AS I3
            ON (IC1.lat, IC1.lon) = (I3.lat, I3.lon)
            AND IC1.pid != I3.pid
    WHERE
        I3.pid IS NULL
    GROUP BY
        IC1.pid
)
SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    InsuranceAfterCond2
GROUP BY
    collect_id
;
