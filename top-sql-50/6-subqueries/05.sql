WITH RequestAcceptedALL AS (
    SELECT
        accepter_id AS requester_id,
        requester_id AS accepter_id,
        accept_date
    FROM
        (SELECT * FROM RequestAccepted) AS AR
    UNION ALL
    SELECT
        requester_id,
        accepter_id,
        accept_date
    FROM
        (SELECT * FROM RequestAccepted) AS RA
)
SELECT
    requester_id AS id,
    COUNT(DISTINCT accepter_id) AS num
FROM RequestAcceptedALL
GROUP BY
    requester_id
ORDER BY
    num DESC
LIMIT 1
;
