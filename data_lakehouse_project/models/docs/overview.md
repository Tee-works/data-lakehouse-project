{% docs __overview__ %}

# Overview of the Data Lakehouse Project

## Project Purpose and Goals

The Data Lakehouse Project aims to create a robust, scalable data platform that merges the flexibility of data lakes with the performance of data warehouses. This project supports various data analytics, reporting, and machine learning workloads efficiently by leveraging modern data engineering tools such as Apache Iceberg, dbt, Trino (via Starburst Galaxy), and Dagster.

## Architecture Overview

The project's architecture is based on a lakehouse model, utilizing Amazon S3 for storage and Apache Iceberg for managing large datasets in a tabular format. The architecture facilitates the ingestion of raw data from various sources, its transformation through dbt models, and future orchestration with Dagster.

**Key Components:**

1. **Amazon S3 and Apache Iceberg**: Serves as the storage layer, supporting structured and unstructured data.
2. **Trino (Starburst Galaxy)**: Provides an interactive SQL query engine to query data across the lakehouse.
3. **dbt (Data Build Tool)**: Manages data transformations with modular SQL-based models, focusing on maintainability and testing.
4. **Dagster** (Future Integration): Will orchestrate the data pipeline, ensuring seamless data flows from ingestion to transformation and reporting.

## Data Sources and Models

### Source Tables
- **`lakehouse.assets`**: Raw asset data ingested into the data lakehouse.
- **`lakehouse.clients`**: Raw client data ingested into the data lakehouse.
- **`lakehouse.transactions`**: Raw transaction data ingested into the data lakehouse.

### Staging Models
- **`stg_assets`**: Cleans and standardizes raw asset data.
- **`stg_clients`**: Cleans and standardizes raw client data.
- **`stg_transactions`**: Cleans and standardizes raw transaction data.

### Dimension and Fact Models
- **Dimension Models**:
  - **`dim_assets`**: Enriched lookup table containing asset details.
  - **`dim_clients`**: Enriched lookup table containing client details.
- **Fact Models**:
  - **`fact_transactions`**: Detailed transactional data optimized for aggregation and analysis.

### Advanced Transformation Models
- **`client_investment_summary`**: Provides aggregated insights into client investment behaviors and metrics.
- **`asset_performance_analysis`**: Analyzes performance and returns of various assets.
- **`transaction_anomaly_detection`**: Detects anomalies in transaction data to flag potential fraud or irregularities.

## Key Transformations and Business Logic

1. **Data Standardization**: Ensures consistent data types, removes duplicates, and handles missing values in staging models.
2. **Data Enrichment**: Dimension tables enhance transactional data with additional descriptive attributes.
3. **Incremental Processing**: Fact models employ incremental logic to process only new or updated data, optimizing performance.
4. **Advanced Analytics**: Models leverage window functions, statistical methods, and complex SQL logic to derive actionable insights.

## Testing and Validation

Data quality is ensured through rigorous testing, including:

- **Schema Tests**: Validate data quality with generic tests (e.g., `unique`, `not_null`, `accepted_values`).
- **Custom Tests**: Verify specific business logic, such as ensuring positive transaction amounts and maintaining referential integrity.

## Future Enhancements and Roadmap

1. **Integration with Dagster**: Future plans include integrating Dagster for orchestrating the entire data pipeline, automating data flow from ingestion to transformation, and enabling efficient job scheduling and monitoring.
   
2. **Enhanced Scalability**: Further enhancements will focus on scalability to accommodate growing data volumes and more complex analytical needs.

3. **Machine Learning Integration**: Plans to incorporate machine learning models for predictive analytics and real-time decision-making, leveraging the structured data in the lakehouse.

4. **Real-Time Data Processing**: Implement real-time or near-real-time data ingestion and processing capabilities to support time-sensitive analytics and reporting needs.

## Visualization and Documentation


The lineage graph illustrates the flow of data through the various models in the dbt project, providing a visual representation of data dependencies and transformations.

{% enddocs %}
