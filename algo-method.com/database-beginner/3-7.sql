WITH remained_results AS (
    SELECT
        email,
        score
    FROM
        results
    EXCEPT
    SELECT
        email,
        score
    FROM
        optout
),
emails_scores AS (
    SELECT
        email,
        SUM(score) AS "合計点"
    FROM
        remained_results
    GROUP BY
        email
    ORDER BY
        "合計点" DESC
    LIMIT 10
)
SELECT
    email
FROM
    emails_scores;
