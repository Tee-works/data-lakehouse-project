-- models/staging/stg_transactions.sql

{{ config(
    materialized='view'
) }}

WITH cleaned_transactions AS (
  SELECT DISTINCT  -- Remove duplicates
    transaction_id,
    client_id,
    asset_id,
    transaction_type,  
    transaction_amount,
    currency,
    exchange_rate,
    COALESCE(KYC_check, 'Unknown') AS KYC_check,  -- Handle nulls in KYC_check
    COALESCE(AML_flag, 'Clear') AS AML_flag,  -- Handle nulls in AML_flag
    timestamp
  FROM {{ source('lakehouse', 'transactions') }}
  WHERE transaction_id IS NOT NULL  -- Ensure no null transaction_ids
)

SELECT * FROM cleaned_transactions;
