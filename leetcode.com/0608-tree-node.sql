SELECT
    T1.id,
    IF (T1.p_id IS NULL, "Root", IF (T2.id IS NULL, "Leaf", "Inner")) AS type
FROM
    Tree AS T1
    LEFT OUTER JOIN Tree AS T2
        ON T1.id = T2.p_id
GROUP BY
    T1.id
;
