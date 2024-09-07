# Data Lakehouse Project - dbt Models

This section of the project focuses on the **dbt models** used for data transformation within the Data Lakehouse architecture.

## Project Overview

This dbt project manages the transformations of data ingested into the data lakehouse. Using modular SQL-based models, we perform various cleaning, standardization, and transformation tasks, ensuring data quality and enabling advanced analytics for the dataset.


### Key Directories

- **models**: Contains all dbt models for the project.
  - **staging/**: Staging models clean and standardize the raw data before transformations.
  - **dim/**: Dimension models contain enriched data for lookup purposes.
  - **fact/**: Fact models aggregate transactional data for analytics.
  - **advanced_transformations/**: Models for advanced analysis, including performance analysis and anomaly detection.
  
- **tests/**: Stores custom and schema tests to ensure data quality and integrity.
- **macros/**: Contains any custom macros used across dbt models.

## Datasets Transformed

This project works on three core datasets:

1. **Clients**: Details about clients, including investment goals and risk profiles.
2. **Assets**: Data about various asset types and their prices.
3. **Transactions**: Transactional data about interactions between clients and assets.

## dbt Models

### Staging Models

Staging models clean and standardize the raw data to prepare it for more complex transformations.

- **stg_clients.sql**: Standardizes client data, removing nulls and duplicates.
- **stg_assets.sql**: Cleans asset data, focusing on correcting data types and filtering out unwanted records.
- **stg_transactions.sql**: Prepares transaction data for fact modeling by filtering and applying standard formats.

### Dimension and Fact Models

- **dim_clients.sql**: A dimension model that enriches client data with attributes like investment goals and risk profiles.
- **dim_assets.sql**: A dimension model that enhances asset data with asset types and other characteristics.
  
- **fact_transactions.sql**: A fact model containing detailed transactional data. Incremental logic is applied here to improve performance by processing only new data.

### Advanced Transformations

- **client_investment_summary.sql**: Aggregates client investment data, showing total and average investments per client.
- **asset_performance_analysis.sql**: Analyzes asset performance over time using moving averages and cumulative returns.
- **transaction_anomaly_detection.sql**: Detects anomalies in transactions using statistical methods, identifying potentially fraudulent transactions.

## Data Lineage

The project ensures a clear data lineage using dbt's documentation and visualization capabilities.

![Data Lineage](screenshots/data_lineage.png)

Testing
We use a combination of schema tests and custom tests to ensure data quality.

Key Tests:
unique: Ensures the uniqueness of primary keys in dimension tables (e.g., client_id, asset_id).
not_null: Verifies that essential fields like transaction_id, client_id, and asset_id are not null.
accepted_values: Ensures that values for certain columns (e.g., risk_profile, transaction_type) are within an acceptable range.

![Data Quality Tests](screenshots/tests.png)

Future Enhancements
Additional Fact Models: Plan to include new fact models for deeper financial analysis.
Custom Macros: Develop reusable macros for common transformations.
Additional Testing: Implement more robust testing frameworks, including coverage for edge cases and advanced data validation