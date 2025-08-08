SELECT
    id,
    name AS "都道府県名",
    population / area AS "人口密度"
FROM
    prefectures
ORDER BY
    "人口密度" DESC;
