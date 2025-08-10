SELECT
    *
FROM
    prefectures
WHERE
    population * 2 > (
        SELECT
            population
        FROM
            prefectures
        WHERE
            name = "東京都"
    )
ORDER BY
    population DESC;
