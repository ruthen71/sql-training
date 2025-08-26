SELECT
    T.request_at AS 'Day',
    ROUND(COUNT((T.status != 'completed') OR NULL) / COUNT(T.status), 2) AS 'Cancellation Rate'
FROM
    Trips AS T
    INNER JOIN Users AS U1
        ON T.client_id = U1.users_id
    INNER JOIN Users AS U2
        ON T.driver_id = U2.users_id
WHERE
    U1.banned = 'No'
    AND U2.banned = 'No'
GROUP BY
    request_at
    HAVING T.request_at BETWEEN '2013-10-01' AND '2013-10-03'
;
