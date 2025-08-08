SELECT
    *
FROM
    prefectures
WHERE
    name IN (
        SELECT
            name
        FROM
            kanto_regions
    );
