SELECT
    Signups.user_id,
    ROUND(IFNULL(COUNT((Confirmations.action = 'confirmed') OR NULL) / COUNT(Confirmations.action), 0), 2) AS confirmation_rate
FROM
    Signups
    LEFT OUTER JOIN Confirmations
        ON Signups.user_id = Confirmations.user_id
GROUP BY
    Signups.user_id
;
