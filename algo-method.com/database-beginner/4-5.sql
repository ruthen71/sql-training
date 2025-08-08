WITH max_score_id_by_name AS (
    SELECT
        id,
        name,
        MAX(score) AS max_score
    FROM
        results
    WHERE
        score = (
            SELECT
                MAX(score)
            FROM
                results AS results_inner
            WHERE
                results_inner.name = results.name
        )
    GROUP BY
        name
)
SELECT
    ROW_NUMBER() OVER (ORDER BY max_score DESC, id ASC) AS "順位",
    name AS "名前",
    max_score AS "スコア"
FROM
    max_score_id_by_name;
