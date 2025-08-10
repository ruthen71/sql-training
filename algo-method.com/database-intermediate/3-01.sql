SELECT
    prefectures.name AS "都道府県名",
    regions.id AS "地方ID",
    regions.name AS "地方名"
FROM
    prefectures
    INNER JOIN regions
        ON prefectures.region_id = regions.id;
