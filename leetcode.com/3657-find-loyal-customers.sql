SELECT
    customer_id
FROM
    customer_transactions
GROUP BY
    customer_id
    HAVING
        COUNT(transaction_id) >= 3
        AND DATEDIFF(MAX(transaction_date), MIN(transaction_date)) >= 30
        AND AVG(IF(transaction_type = 'refund', 1, 0)) < 0.2
ORDER BY
    customer_id
;
