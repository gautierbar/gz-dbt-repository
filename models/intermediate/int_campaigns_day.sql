SELECT  
    date_date
    ,ROUND(SUM(ads_cost), 2) AS ads_cost
    ,ROUND(SUM(impression), 2) AS ads_impressions
    ,ROUND(SUM(click), 2) AS ads_clicks
FROM 
    {{ ref('int_campaigns') }}
GROUP BY 
    date_date