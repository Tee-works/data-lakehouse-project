-- tests/test_transactions_client_id_exists.sql

WITH transactions AS (
    SELECT client_id FROM {{ ref('fact_transactions') }}
),
clients AS (
    SELECT client_id FROM {{ ref('dim_clients') }}
)

SELECT *
FROM transactions
LEFT JOIN clients ON transactions.client_id = clients.client_id
WHERE clients.client_id IS NULL
