{% macro margin_percent(revenue, purchase_cost)%}
    ROUND((revenue - purchase_cost) / purchase_cost, 2)
{% endmacro %}