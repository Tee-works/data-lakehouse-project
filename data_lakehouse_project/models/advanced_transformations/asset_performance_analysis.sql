-- models/advanced/asset_performance_analysis.sql

{{ config(
    materialized='table'
) }}

WITH asset_returns AS (
    SELECT 
        a.asset_id,
        a.asset_type,
        t.timestamp,
        t.transaction_amount,
        SUM(t.transaction_amount) OVER (PARTITION BY a.asset_id ORDER BY t.timestamp) AS cumulative_return,  -- Cumulative return calculation
        AVG(t.transaction_amount) OVER (PARTITION BY a.asset_id ORDER BY t.timestamp ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS moving_avg_return  -- 7-day moving average return
    FROM {{ ref('fact_transactions') }} t
    JOIN {{ ref('dim_assets') }} a ON t.asset_id = a.asset_id
    WHERE t.transaction_type = 'Sell'  -- Consider only 'Sell' transactions for performance analysis
)

SELECT * FROM asset_returns  -- Moved semicolon to correct position
