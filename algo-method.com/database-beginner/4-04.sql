WITH rank_by_score AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY score DESC) AS "順位",
        name AS "名前",
        score AS "スコア"
    FROM
        results
)
SELECT
    *
FROM
    rank_by_score
WHERE
    "順位" IN (1, 2, 3, 10);
