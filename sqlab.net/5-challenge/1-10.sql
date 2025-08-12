DELETE FROM
    events
WHERE
    id = 1;

UPDATE
    events
SET
    max_num = 200
WHERE
    id = 2;

INSERT INTO
    events (id, name, max_num)
VALUES
    (3, '古本まつり', 75);

SELECT
    *
FROM
    events;
