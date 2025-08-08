SELECT
    CASE
        WHEN age < 15 THEN "年少人口"
        WHEN age < 65 THEN "生産年齢人口"
        ELSE "老年人口"
    END AS "年齢3区分",
    SUM(total) AS "総人口"
FROM
    population
GROUP BY
    "年齢3区分";
