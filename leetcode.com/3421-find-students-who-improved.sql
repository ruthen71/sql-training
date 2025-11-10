WITH scores_with_order AS (
    SELECT
        student_id
        , subject
        , score
        , exam_date
        , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS asc_number
        , ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS desc_number
    FROM
        Scores
)
, first_scores AS (
    SELECT
        student_id
        , subject
        , score
    FROM
        scores_with_order
    WHERE
        asc_number = 1
)
, latest_scores AS (
    SELECT
        student_id
        , subject
        , score
    FROM
        scores_with_order
    WHERE
        desc_number = 1
)
SELECT
    first_scores.student_id
    , first_scores.subject
    , first_scores.score AS first_score
    , latest_scores.score AS latest_score
FROM
    first_scores
    INNER JOIN latest_scores
        ON first_scores.student_id = latest_scores.student_id
        AND first_scores.subject = latest_scores.subject
GROUP BY
    first_scores.student_id
    , first_scores.subject
    HAVING
        first_scores.score < latest_scores.score
ORDER BY
    first_scores.student_id ASC
    , first_scores.subject ASC
;
/*
-- Another solution
-- argmax/min を直接求める方法
-- Window 関数と GROUP BY を同じ命令の中で使うと壊れる
-- まず CTE で argmax/min を求める
-- これだと student_id, subject ごとに行数だけ argmax/min が得られる
-- その後 GROUP BY で重複排除する
WITH scores_first_latest AS (
    SELECT
        student_id
        , subject
        , FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date ASC) AS first_score
        , FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_score
    FROM
        Scores
)
SELECT
    student_id
    , subject
    , first_score
    , latest_score
FROM
    scores_first_latest
GROUP BY
    student_id
    , subject
    HAVING
        first_score < latest_score
ORDER BY
    student_id
    , subject
;
*/
