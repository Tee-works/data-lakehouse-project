CREATE TABLE lakehouse.default.clients (
    client_id INT,
    client_name VARCHAR,
    country VARCHAR,
    investment_goal VARCHAR,
    risk_profile VARCHAR,
    account_type VARCHAR
)
WITH (
    format = 'PARQUET',
    partitioning = ARRAY['country'],
    location = 's3a://data-lakehouse-platform/iceberg-tables/clients/'
);

CREATE TABLE lakehouse.default.assets (
    asset_id INT,
    asset_type VARCHAR,
    price DOUBLE,
    timestamp TIMESTAMP(6)
)
WITH (
    format = 'PARQUET',
    location = 's3a://data-lakehouse-platform/iceberg-tables/assets/',
    partitioning = ARRAY['day(timestamp)']
);




CREATE TABLE lakehouse.default.transactions (
    transaction_id INT,
    client_id INT,
    asset_id INT,
    transaction_type VARCHAR,
    transaction_amount DOUBLE,
    currency VARCHAR,
    exchange_rate DOUBLE,
    KYC_check VARCHAR,
    AML_flag VARCHAR,
    timestamp TIMESTAMP(6)
)
WITH (
    format = 'PARQUET',
    location = 's3a://data-lakehouse-platform/iceberg-tables/transactions/',
    partitioning = ARRAY['day(timestamp)']
);

