WITH paid_users AS (
    SELECT
        DISTINCT user_id
    FROM
        UserActivity
    WHERE
        activity_type = 'paid'
)
SELECT
    user_id
    , ROUND(SUM(IF(activity_type = 'free_trial', activity_duration, 0)) / SUM(IF(activity_type = 'free_trial', 1, 0)), 2) AS trial_avg_duration
    , ROUND(SUM(IF(activity_type = 'paid', activity_duration, 0)) / SUM(IF(activity_type = 'paid', 1, 0)), 2) AS paid_avg_duration
FROM
    UserActivity
WHERE
    user_id IN (SELECT * FROM paid_users)
GROUP BY
    user_id
ORDER BY
    user_id ASC
;
