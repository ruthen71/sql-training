WITH RequestAcceptedALL AS (
    SELECT
        requester_id,
        accepter_id
    FROM
        RequestAccepted
    UNION ALL
    SELECT
        accepter_id AS requester_id,
        requester_id AS accepter_id
    FROM
        RequestAccepted
)
SELECT
    requester_id AS id,
    COUNT(DISTINCT accepter_id) AS num
FROM
    RequestAcceptedALL
GROUP BY
    requester_id
ORDER BY
    num DESC
LIMIT 1
;
