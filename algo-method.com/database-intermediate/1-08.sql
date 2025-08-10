UPDATE
    grades
SET
    score = 25
WHERE
    problem_id = 1;
SELECT
    name AS "名前",
    SUM(score) AS "合計点"
FROM
    grades
GROUP BY
    name;
