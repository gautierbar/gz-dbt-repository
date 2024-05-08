SELECT 
    fd.*
    ,IFNULL(fd.operational_margin - cd.ads_cost, 0) AS ads_margin
FROM 
    {{ ref('finance_days') }} AS fd
LEFT JOIN 
    {{ ref('int_campaigns_day') }} AS cd 
USING (date_date)