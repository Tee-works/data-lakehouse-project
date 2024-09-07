-- models/dim/dim_clients.sql

{{ config(
    materialized='table'
) }}

SELECT 
    client_id,
    client_name,
    country,
    investment_goal,
    risk_profile,
    account_type
FROM {{ ref('stg_clients') }} 
