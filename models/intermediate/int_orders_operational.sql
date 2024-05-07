-- Operational margin = margin + shipping fee - log_cost - ship_cost

WITH kpi_ship AS(
    SELECT  
        om.orders_id AS orders_id
        ,om.date_date AS date_date
        ,om.margin AS margin
        ,sh.shipping_fee AS shipping_fee
        ,CAST(sh.ship_cost AS FLOAT64) AS ship_cost
        ,sh.logcost AS logcost
    FROM
        {{ ref('int_orders_margin') }} AS om 
    LEFT JOIN
        {{ ref('stg_raw__ship') }} AS sh 
    USING (orders_id)
)

SELECT 
    *
    ,ROUND(margin + shipping_fee - logcost - ship_cost, 2) AS operational_margin
FROM 
    kpi_ship
