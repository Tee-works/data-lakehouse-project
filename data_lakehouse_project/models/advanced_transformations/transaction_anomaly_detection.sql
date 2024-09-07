-- models/advanced/transaction_anomaly_detection.sql

{{ config(
    materialized='table'
) }}

WITH transaction_stats AS (
    SELECT 
        client_id,
        AVG(transaction_amount) AS avg_transaction_amount,
        STDDEV(transaction_amount) AS stddev_transaction_amount  -- Standard deviation for anomaly detection
    FROM {{ ref('fact_transactions') }}
    GROUP BY client_id
),

anomalous_transactions AS (
    SELECT 
        t.transaction_id,
        t.client_id,
        t.transaction_amount,
        s.avg_transaction_amount,
        s.stddev_transaction_amount,
        CASE 
            WHEN ABS(t.transaction_amount - s.avg_transaction_amount) > 3 * s.stddev_transaction_amount THEN 'Anomaly'  -- Identify anomalies
            ELSE 'Normal'
        END AS transaction_status
    FROM {{ ref('fact_transactions') }} t
    JOIN transaction_stats s ON t.client_id = s.client_id
)

SELECT * FROM anomalous_transactions
WHERE transaction_status = 'Anomaly'  -- Moved semicolon to correct position
