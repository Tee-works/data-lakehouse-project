-- models/staging/stg_clients.sql

{{ config(
    materialized='view' 
) }}

WITH cleaned_clients AS (
  SELECT 
    CAST(client_id AS INT) AS client_id,  -- Ensure the client_id is an integer
    client_name,
    country,
    investment_goal,
    risk_profile,
    account_type
  FROM {{ source('lakehouse', 'clients') }}
  WHERE client_id IS NOT NULL  -- Filter out rows with null client_id
)

SELECT * FROM cleaned_clients;
