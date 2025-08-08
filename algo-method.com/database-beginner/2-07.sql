SELECT
    prefectures.name AS "都道府県名",
    regions.name AS "地方名"
FROM
    prefectures JOIN regions
WHERE
    prefectures.region_id = regions.id;
