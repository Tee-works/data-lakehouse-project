INSERT INTO lakehouse.default.clients
SELECT 
    CAST(client_id AS INT) AS client_id,
    client_name,
    country,
    investment_goal,
    risk_profile,
    account_type
FROM hive.fin_database.clients_external;


INSERT INTO lakehouse.default.assets
SELECT 
    CAST(asset_id AS INT) AS asset_id,
    asset_type,
    CAST(price AS DOUBLE) AS price,
    CAST(timestamp AS TIMESTAMP(6)) AS timestamp
FROM hive.fin_database.assets_external;



INSERT INTO lakehouse.default.transactions
SELECT 
    CAST(transaction_id AS INT) AS transaction_id,
    CAST(client_id AS INT) AS client_id,
    CAST(asset_id AS INT) AS asset_id,
    transaction_type,
    CAST(transaction_amount AS DOUBLE) AS transaction_amount,
    currency,
    CAST(exchange_rate AS DOUBLE) AS exchange_rate,
    KYC_check,
    AML_flag,
    CAST(timestamp AS TIMESTAMP(6)) AS timestamp  -- Explicitly casting to TIMESTAMP(6)
FROM hive.fin_database.transactions_external;
