CREATE TABLE hive.fin_database.assets_external (
    asset_id VARCHAR(255),   
    asset_type VARCHAR(100), 
    price DECIMAL(10, 2),   
    timestamp TIMESTAMP      
)
WITH (
  external_location = 's3://data-lakehouse-platform/raw/assets/',
  format = 'CSV',
  csv_escape = '\',
  csv_quote = '"',
  csv_separator = ',',
  skip_header_line_count = 1
);

CREATE TABLE hive.fin_database.clients_external (
    client_id VARCHAR(255),       
    client_name VARCHAR(255),
    country VARCHAR(100),
    investment_goal VARCHAR(255),
    risk_profile VARCHAR(50),
    account_type VARCHAR(50)
)
WITH (
  external_location = 's3a://data-lakehouse-platform/raw/clients/',
  format = 'CSV',
  csv_escape = '\',
  csv_quote = '"',
  csv_separator = ',',
  skip_header_line_count = 1
);

CREATE TABLE hive.fin_database.transactions_external (
    transaction_id VARCHAR(255),
    client_id VARCHAR(255),
    asset_id VARCHAR(255),
    transaction_type VARCHAR(100),
    transaction_amount DECIMAL(12, 2),  
    currency VARCHAR(10),
    exchange_rate DECIMAL(10, 4),      
    KYC_check BOOLEAN,                  
    AML_flag BOOLEAN,
    timestamp TIMESTAMP                 
)
WITH (
  external_location = 's3a://data-lakehouse-platform/raw/transactions/',
  format = 'CSV',
  csv_escape = '\',
  csv_quote = '"',
  csv_separator = ',',
  skip_header_line_count = 1
);
