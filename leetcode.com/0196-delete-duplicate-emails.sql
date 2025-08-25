DELETE
    p
FROM
    Person AS p
    INNER JOIN Person AS q
        ON p.email = q.email
        AND p.id > q.id
;
