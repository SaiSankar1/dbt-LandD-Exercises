{{
    config(
        materialized = 'view',
        database = 'learningexercises',
        schema = 'exercise1'
    )
}}

select * from {{ source( 'src', 'NATION' ) }}