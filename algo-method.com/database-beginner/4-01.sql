SELECT
    *
FROM
    users
WHERE
    name LIKE "%RURU"
    AND flg_data_public = TRUE
    AND rank IS NULL;
