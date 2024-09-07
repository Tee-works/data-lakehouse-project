-- models/advanced/client_investment_summary.sql

{{ config(
    materialized='table'
) }}

WITH client_summary AS (
    SELECT 
        t.client_id,
        c.client_name,
        c.investment_goal,
        c.risk_profile,
        COUNT(t.transaction_id) AS transaction_count,  -- Count of transactions
        SUM(t.transaction_amount) AS total_investment,  -- Total investment amount
        AVG(t.transaction_amount) AS avg_investment  -- Average investment amount
    FROM {{ ref('fact_transactions') }} t
    JOIN {{ ref('dim_clients') }} c ON t.client_id = c.client_id
    WHERE t.transaction_type = 'Buy'  -- Consider only 'Buy' transactions for investment analysis
    GROUP BY 
        t.client_id, 
        c.client_name,
        c.investment_goal,
        c.risk_profile
)

SELECT * FROM client_summary  
