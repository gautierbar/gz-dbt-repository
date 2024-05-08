SELECT 
    CONCAT(EXTRACT(MONTH FROM date_date), "-", EXTRACT(YEAR FROM date_date)) AS datemonth
    ,SUM(nb_transactions) AS nb_transactions
    ,SUM(revenue) AS revenue 
    ,SUM(average_basket) AS average_basket
    ,SUM(margin) AS margin
    ,SUM(operational_margin) AS operational_margin
    ,SUM(ads_margin) AS ads_margin
FROM 
    {{ ref('finance_campaigns_day') }}
GROUP BY 
    datemonth
ORDER BY 
    datemonth DESC