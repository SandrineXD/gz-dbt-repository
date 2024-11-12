with 

source as (
    
    select 
        products_id,         
        purchSE_PRICE        
    from {{ source('raw', 'product') }}
),

cleaned_product as (
   
    select
        products_id,  
        CAST(purchSE_PRICE AS FLOAT64) AS purchase_price  
    from source
)

select * 
from cleaned_product