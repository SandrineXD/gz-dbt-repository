SELECT
    o.orders_id,
    o.date_date,
    ROUND(o.margin + s.shipping_fee - (s.logcost + s.ship_cost), 2) AS operational_margin, -- Calcul de la marge opérationnelle
    o.quantity,
    o.revenue,
    o.purchase_cost,
    o.margin,
    s.shipping_fee,
    s.logcost,
    s.ship_cost
FROM {{ ref("int_orders_margin") }} AS o
LEFT JOIN {{ ref("stg_raw__ship") }} AS s
    USING (orders_id)
ORDER BY orders_id DESC