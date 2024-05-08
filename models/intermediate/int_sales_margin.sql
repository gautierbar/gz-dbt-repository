-- Margin = Revenue - Purchase_cost; Purchase_cost = Quantity * Purchase_price

WITH join_sales_product AS(
    SELECT  
    s.date_date AS date_date
    ,s.orders_id AS orders_id
    ,s.pdt_id AS products_id
    ,s.revenue AS revenue
    ,s.quantity AS qty
    ,CAST(p.purchse_price AS FLOAT64) AS purchase_price
    FROM
    {{source('raw', 'sales')}} AS s
    LEFT JOIN
    {{source('raw', 'product')}} AS p
    ON s.pdt_id = p.products_id
)

,sales_purchase_cost AS(
SELECT
    *
    ,ROUND(qty * purchase_price, 2) AS purchase_cost
FROM
    join_sales_product
)

SELECT 
    *,
    ROUND(revenue - purchase_cost, 2) AS margin
    ,{{margin_percent(revenue, purchase_cost)}} AS margin_percent
FROM 
    sales_purchase_cost