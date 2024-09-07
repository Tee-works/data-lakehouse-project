import pandas as pd
import numpy as np
from datetime import datetime, timedelta
from faker import Faker

# Initialize Faker
fake = Faker()

# Generate Clients Data
clients = pd.DataFrame({
    'client_id': np.arange(1, 10001),
    'client_name': [fake.name() for _ in range(10000)],
    'country': [fake.country() for _ in range(10000)],
    'investment_goal': np.random.choice(['Growth', 'Income', 'Balanced'], 10000),
    'risk_profile': np.random.choice(['Conservative', 'Moderate', 'Aggressive'], 10000),
    'account_type': np.random.choice(['individual', 'corporate'], 10000)
})

# Generate Assets Data
assets = pd.DataFrame({
    'asset_id': np.arange(1, 100001),
    'asset_type': np.random.choice(['equity', 'bond', 'real_estate', 'commodity'], 100000),
    'price': np.random.uniform(100, 1000, 100000),
    'timestamp': [fake.date_time_this_year() for _ in range(100000)]
})

# Generate Transactions Data
transactions = pd.DataFrame({
    'transaction_id': np.arange(1, 1000001),
    'client_id': np.random.choice(clients['client_id'], 1000000),
    'asset_id': np.random.choice(assets['asset_id'], 1000000),
    'transaction_type': np.random.choice(['Buy', 'Sell', 'Dividend', 'Interest'], 1000000),
    'transaction_amount': np.random.uniform(1000, 100000, 1000000),
    'currency': np.random.choice(['USD', 'EUR', 'CHF', 'GBP'], 1000000),
    'exchange_rate': np.round(np.random.uniform(0.8, 1.5, 1000000), 4),
    'KYC_check': np.random.choice(['Passed', 'Failed'], 1000000, p=[0.98, 0.02]),
    'AML_flag': np.random.choice(['Clear', 'Flagged'], 1000000, p=[0.995, 0.005]),
    'timestamp': [fake.date_time_this_year() for _ in range(1000000)]
})

# Save as CSV
clients.to_csv('clients.csv', index=False)
assets.to_csv('assets.csv', index=False)
transactions.to_csv('transactions.csv', index=False)

