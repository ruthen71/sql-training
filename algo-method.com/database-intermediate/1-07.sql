SELECT
    ROW_NUMBER() OVER (ORDER BY score DESC) AS "順位",
    name AS "名前",
    score AS "スコア"
FROM
    results
LIMIT 20 OFFSET 40;
