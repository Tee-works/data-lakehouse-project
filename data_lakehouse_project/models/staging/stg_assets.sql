-- models/staging/stg_assets.sql

{{ config(
    materialized='view'
) }}

WITH cleaned_assets AS (
  SELECT DISTINCT  -- Remove duplicates
    asset_id,
    asset_type,  
    CASE 
      WHEN price < 0 THEN 0  -- Handle negative prices, if needed
      ELSE price 
    END AS price,
    timestamp
  FROM {{ source('lakehouse', 'assets') }}
  WHERE asset_id IS NOT NULL  -- Ensure no null asset_ids
)

SELECT * FROM cleaned_assets;
