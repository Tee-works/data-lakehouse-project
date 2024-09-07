-- tests/test_positive_transaction_amount.sql

WITH transactions AS (
    SELECT * FROM {{ ref('fact_transactions') }}
)

SELECT *
FROM transactions
WHERE transaction_amount <= 0
