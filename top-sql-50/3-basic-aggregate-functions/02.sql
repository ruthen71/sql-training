SELECT
    Prices.product_id,
    ROUND(IFNULL(SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units), 0), 2) AS average_price
FROM
    Prices
    LEFT OUTER JOIN UnitsSold
        ON Prices.product_id = UnitsSold.product_id
        AND Prices.start_date <= UnitsSold.purchase_date
        AND UnitsSold.purchase_date <= Prices.end_date
GROUP BY
    Prices.product_id
;
