SELECT
    choice AS "選択肢",
    COUNT(*) AS "得票数"
FROM
    votes
GROUP BY
    choice
ORDER BY
    "得票数" DESC, choice ASC;
