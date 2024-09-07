{{ 
  config(
    materialized='incremental',  
    unique_key='transaction_id',
    on_schema_change='fail'  
  ) 
}}

WITH enriched_transactions AS (
    SELECT 
        t.transaction_id,
        t.client_id,
        t.asset_id,
        t.transaction_type,
        t.transaction_amount,
        t.currency,
        t.exchange_rate,
        t.KYC_check,
        t.AML_flag,
        t.timestamp,
        a.asset_type,
        c.investment_goal,
        c.risk_profile
    FROM {{ ref('stg_transactions') }} t
    LEFT JOIN {{ ref('dim_clients') }} c ON t.client_id = c.client_id
    LEFT JOIN {{ ref('dim_assets') }} a ON t.asset_id = a.asset_id
)

SELECT 
    transaction_id,
    client_id,
    asset_id,
    transaction_type,
    transaction_amount,
    currency,
    exchange_rate,
    KYC_check,
    AML_flag,
    timestamp,
    asset_type,
    investment_goal,
    risk_profile
FROM enriched_transactions
{% if is_incremental() %}
WHERE timestamp > (SELECT MAX(timestamp) FROM {{ this }})  -- Incremental logic to process only new data
{% endif %}




 

