WITH stores_with_rn AS (
    SELECT
        stores.store_id
        , stores.store_name
        , stores.location
        , inventory.quantity
        , inventory.product_name
        , ROW_NUMBER() OVER (PARTITION BY stores.store_id ORDER BY inventory.price ASC) AS rn_asc
        , ROW_NUMBER() OVER (PARTITION BY stores.store_id ORDER BY inventory.price DESC) AS rn_desc
    FROM
        stores
        INNER JOIN inventory
            ON stores.store_id = inventory.store_id
)
, stores_with_quantity AS (
    SELECT
        store_id
        , store_name
        , location
        , SUM(IF(rn_asc = 1, quantity, 0)) AS cheapest_quantity
        , SUM(IF(rn_desc = 1, quantity, 0)) AS most_exp_quantity
        , MAX(IF(rn_asc = 1, product_name, "")) AS cheapest_product
        , MAX(IF(rn_desc = 1, product_name, "")) AS most_exp_product
    FROM
        stores_with_rn
    WHERE
        (rn_asc = 1 AND rn_desc >= 3)
        OR (rn_desc = 1 AND rn_asc >= 3)
    GROUP BY
        store_id
)
SELECT
    store_id
    , store_name
    , location
    , most_exp_product
    , cheapest_product
    , ROUND(cheapest_quantity / most_exp_quantity, 2) AS imbalance_ratio
FROM
    stores_with_quantity
WHERE
    most_exp_quantity < cheapest_quantity
ORDER BY
    imbalance_ratio DESC
    , store_name ASC
;
