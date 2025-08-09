SELECT
    SUM(score) / COUNT(*) AS "平均点",
    MAX(score) AS "最高点"
FROM
    grades;
