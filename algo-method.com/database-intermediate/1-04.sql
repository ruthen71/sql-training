SELECT
    SUBSTR(name, -1) AS "分類",
    COUNT(*) AS "総数"
FROM
    prefectures
GROUP BY
    SUBSTR(name, -1);
