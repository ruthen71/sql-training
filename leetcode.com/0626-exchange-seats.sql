SELECT
    S1.id,
    IF(S2.student IS NOT NULL, S2.student, S1.student) AS student
FROM
    Seat AS S1
    LEFT OUTER JOIN Seat AS S2
        ON IF(S1.id % 2 = 1, S1.id + 1, S1.id - 1) = S2.id
;
