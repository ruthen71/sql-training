SELECT
    prefectures.name AS "都道府県名",
    cities.name AS "市町村名",
    wards.name AS "区名"
FROM
    prefectures
    INNER JOIN (
        cities
        INNER JOIN wards
            ON cities.id = wards.city_id
    )
        ON prefectures.id = cities.prefecture_id;
