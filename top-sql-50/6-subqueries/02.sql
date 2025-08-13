SELECT
    CASE
        WHEN s.id <= t.n AND s.id % 2 = 0 THEN s.id - 1
        WHEN s.id <= t.n AND s.id % 2 = 1 THEN s.id + 1
        ELSE s.id
    END AS id,
    s.student
FROM
    Seat AS s
    CROSS JOIN (SELECT IF(COUNT(*) % 2 = 0, COUNT(*), COUNT(*) - 1) AS n FROM Seat) AS t
ORDER BY
    id ASC
;
