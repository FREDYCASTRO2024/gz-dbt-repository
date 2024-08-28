select
    products_id,
    date_date,
    orders_id,
    revenue,
    quantity,
    CAST(purchase_price AS FLOAT64),
    round(s.quantity*CAST(p.purchase_price AS FLOAT64),2) as purchase_cost,
    s.revenue - round(s.quantity*CAST(purchase_price AS FLOAT64),2) as margin
from {{ ref("stg_raw__sales") }} s
left join {{ ref("stg_raw__product") }} p using (products_id)
