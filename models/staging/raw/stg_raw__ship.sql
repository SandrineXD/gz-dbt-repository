with 

source as (
    
    select * 
    from {{ source('raw', 'ship') }}
),

cleaned_ship as (

    select
        order_id,
        shipping_fee,  
        CAST(ship_cost AS FLOAT64) AS ship_cost 
    from source
    where shipping_fee = shipping_fee_1 
)

select * 
from cleaned_ship