SELECT
    gender,
    COUNT(*) AS num
FROM
    authors
GROUP BY
    gender
ORDER BY
    num DESC;
