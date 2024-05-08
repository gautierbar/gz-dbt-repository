{{ dbt_utils.union_relations(
    relations=[
        ref('stg_raw__adwords'),
        ref('stg_raw__bing'),
        ref('stg_raw__facebook'),
        ref('stg_raw__criteo')
    ]
) }}


/*

SELECT 
    *
FROM 
    {{ ref('stg_raw__adwords') }}
UNION ALL
SELECT 
    *
FROM 
    {{ ref('stg_raw__bing') }}
UNION ALL
SELECT 
    *
FROM 
    {{ ref('stg_raw__facebook') }}
UNION ALL
SELECT 
    *
FROM 
    {{ ref('stg_raw__criteo') }}

*/