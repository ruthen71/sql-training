WITH reviews_rn AS (
    SELECT
        review_id
        , employee_id
        , rating
        , ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS rn
    FROM
        performance_reviews
)
, employee_ratings AS (
    SELECT
        employee_id
        , MIN(IF(rn = 1, rating, 100)) AS rating1
        , MIN(IF(rn = 2, rating, 100)) AS rating2
        , MIN(IF(rn = 3, rating, 100)) AS rating3
    FROM
        reviews_rn
    GROUP BY
        employee_id
        HAVING rating3 != 100
)
SELECT
    employees.employee_id
    , employees.name
    , employee_ratings.rating1 - employee_ratings.rating3 AS improvement_score
FROM
    employees
    INNER JOIN employee_ratings
        ON employees.employee_id = employee_ratings.employee_id
WHERE
    employee_ratings.rating3 < employee_ratings.rating2
    AND employee_ratings.rating2 < employee_ratings.rating1
ORDER BY
    improvement_score DESC
    , employees.name ASC
;
/*
-- another solution
-- first, second, third をそれぞれ求める
WITH reviews_rn AS (
    SELECT
        review_id
        , employee_id
        , rating
        , ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS rn
    FROM
        performance_reviews
)
, first_reviews AS (
    SELECT
        employee_id
        , rating
    FROM
        reviews_rn
    WHERE
        reviews_rn.rn = 3
), second_reviews AS (
    SELECT
        employee_id
        , rating
    FROM
        reviews_rn
    WHERE
        reviews_rn.rn = 2
), third_reviews AS (
    SELECT
        employee_id
        , rating
    FROM
        reviews_rn
    WHERE
        reviews_rn.rn = 1
)
SELECT
    employees.employee_id
    , employees.name
    , third_reviews.rating - first_reviews.rating AS improvement_score
FROM
    employees
    INNER JOIN first_reviews
        ON employees.employee_id = first_reviews.employee_id
    INNER JOIN second_reviews
        ON employees.employee_id = second_reviews.employee_id
    INNER JOIN third_reviews
        ON employees.employee_id = third_reviews.employee_id
WHERE
    first_reviews.rating < second_reviews.rating
    AND second_reviews.rating < third_reviews.rating
ORDER BY
    improvement_score DESC
    , employees.name ASC
;
*/
