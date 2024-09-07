-- models/dim/dim_assets.sql

{{ config(
    materialized='table'
) }}

SELECT 
    asset_id,
    asset_type
FROM {{ ref('stg_assets') }}  -- Reference the cleaned staging model for assets
