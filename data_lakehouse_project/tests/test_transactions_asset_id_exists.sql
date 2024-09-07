-- tests/test_transactions_asset_id_exists.sql

WITH transactions AS (
    SELECT asset_id FROM {{ ref('fact_transactions') }}
),
assets AS (
    SELECT asset_id FROM {{ ref('dim_assets') }}
)

SELECT *
FROM transactions
LEFT JOIN assets ON transactions.asset_id = assets.asset_id
WHERE assets.asset_id IS NULL
