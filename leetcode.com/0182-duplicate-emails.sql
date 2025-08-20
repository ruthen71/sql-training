SELECT
    DISTINCT email AS Email
FROM
    Person
WHERE
    email IN (
        SELECT
            email
        FROM
            Person AS P
        WHERE
            P.email = Person.email
            AND P.id != Person.id
    )
;
