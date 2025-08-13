SELECT
    ROUND(SUM(sub.tiv_2016), 2) AS tiv_2016
FROM (
    SELECT
        *,
        CONCAT(CAST(lat AS CHAR), CAST(lon AS CHAR)) AS lat_lon,
        CASE WHEN COUNT(tiv_2015) OVER (PARTITION BY tiv_2015) = 1
             THEN 'UNIQUE'
             ELSE 'DUPLICATE'
        END AS uniqueness_flag1,
        CASE WHEN COUNT(CONCAT(CAST(lat AS CHAR), CAST(lon AS CHAR))) OVER (PARTITION BY CONCAT(CAST(lat AS CHAR), CAST(lon AS CHAR))) = 1
             THEN 'UNIQUE'
             ELSE 'DUPLICATE'
        END AS uniqueness_flag2
    FROM
        Insurance
) AS sub
WHERE
    sub.uniqueness_flag1 = 'DUPLICATE'
    AND sub.uniqueness_flag2 = 'UNIQUE'
;
