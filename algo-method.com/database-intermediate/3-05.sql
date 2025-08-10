SELECT
    prefectures.name AS "都道府県名"
FROM
    cities
    INNER JOIN prefectures
        ON cities.prefecture_id = prefectures.id
WHERE
    cities.name = "府中市";
