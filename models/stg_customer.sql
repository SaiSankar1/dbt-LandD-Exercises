{{
    config(
        materialized = 'table',
        database = 'learningexercises',
        schema = 'exercise1'
    )
}}

select *
from {{ source( 'src', 'CUSTOMER' ) }}