SELECT
    Prices.product_id,
    ROUND(
        IFNULL(
            SUM(UnitsSold.units * Prices.price) / SUM(UnitsSold.units),
            0
        ),
        2
    ) AS average_price
FROM
    Prices
    LEFT OUTER JOIN UnitsSold
        ON Prices.product_id = UnitsSold.product_id
        AND Prices.start_date <= UnitsSold.purchase_date
        AND Prices.end_date >= UnitsSold.purchase_date 
GROUP BY
    product_id
;
