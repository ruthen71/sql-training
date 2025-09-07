WITH over_100_ids AS (
    SELECT
        id
    FROM
        Stadium
    WHERE
        people >= 100
)
SELECT
    *
FROM
    Stadium
WHERE
    (id - 2 IN (SELECT * FROM over_100_ids) AND id - 1 IN (SELECT * FROM over_100_ids) AND id - 0 IN (SELECT * FROM over_100_ids))
    OR (id - 1 IN (SELECT * FROM over_100_ids) AND id - 0 IN (SELECT * FROM over_100_ids) AND id + 1 IN (SELECT * FROM over_100_ids))
    OR (id - 0 IN (SELECT * FROM over_100_ids) AND id + 1 IN (SELECT * FROM over_100_ids) AND id + 2 IN (SELECT * FROM over_100_ids))
ORDER BY
    visit_date
;
