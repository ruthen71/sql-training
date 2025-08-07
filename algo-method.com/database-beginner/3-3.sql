SELECT
    *,
    CASE
        WHEN score < 50 THEN "不可"
        WHEN score < 65 THEN "可"
        WHEN score < 80 THEN "良"
        WHEN score < 90 THEN "優"
        ELSE "秀"
    END AS "評価"
FROM
    grades;
