SELECT
    user_id,
    CONCAT(SUBSTR(UPPER(name), 1, 1), SUBSTR(LOWER(name), 2)) AS name
FROM
    Users
ORDER BY
    user_id ASC
;
