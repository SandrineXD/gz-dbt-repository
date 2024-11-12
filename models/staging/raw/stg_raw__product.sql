with 

source as (
    select * 
    from {{ source('raw', 'product') }}
),

cleaned_product as (
    select
        product_id,
        product_name,
        CAST(purchse_price AS FLOAT64) AS purchase_price
    from source
)
select * 
from cleaned_product
