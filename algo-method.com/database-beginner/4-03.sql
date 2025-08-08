WITH remained_results AS (
    SELECT
        id,
        name,
        score
    FROM
        results
    WHERE
        name NOT IN (SELECT name FROM optout)
)
SELECT
    ROW_NUMBER() OVER (ORDER BY score DESC) AS "順位",
    name AS "名前",
    score AS "スコア"
FROM
    remained_results;
