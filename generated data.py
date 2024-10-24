import mysql.connector
import uuid
from faker import Faker
from dotenv import load_dotenv
import random
from datetime import datetime, timedelta
import os

# Load environment variables
load_dotenv()

# Connection settings
HOST = os.getenv('host')
USER = os.getenv('user')
PASSWORD = os.getenv('password')
DATABASE = os.getenv('database')

# Connect to the MySQL database
connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='HT9c^T%-f84@Azf7',
    database='practical assignment 03'
)

cursor = connection.cursor()
fake = Faker()

# Insert data into Workers table
print("Inserting into Workers...")
worker_insert_query = """
    INSERT INTO Workers (worker_id, first_name, last_name, phone_number, worker_role, hire_date, employment_status, salary)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
"""
workers_data = [
    (str(uuid.uuid4()), fake.first_name(), fake.last_name(), fake.phone_number(), fake.job(), fake.date_this_decade(), random.choice(['Full-Time', 'Part-Time', 'Contractor']), random.randint(40000, 120000))
    for _ in range(1000)
]
cursor.executemany(worker_insert_query, workers_data)
connection.commit()
print("Inserted into Workers.")

# Insert data into Finances table
print("Inserting into Finances...")
finance_insert_query = """
    INSERT INTO Finances (finance_id, revenue, expenses, net_profit, payment_date)
    VALUES (%s, %s, %s, %s, %s)
"""
finances_data = [
    (str(uuid.uuid4()), random.randint(100000, 500000), random.randint(50000, 300000), random.randint(10000, 200000), fake.date_this_year())
    for _ in range(1500)
]
cursor.executemany(finance_insert_query, finances_data)
connection.commit()
print("Inserted into Finances.")

# Insert data into Project table
print("Inserting into Project...")
project_insert_query = """
    INSERT INTO Project (project_id, project_name, start_date, end_date, budget, status, description, finance_id, worker_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
"""
projects_data = [
    (str(uuid.uuid4()), fake.word(), fake.date_this_decade(), fake.date_this_decade(), random.randint(100000, 1000000), random.choice(['In Progress', 'Completed']), fake.text(), random.choice(finances_data)[0], random.choice(workers_data)[0])
    for _ in range(1500)
]
cursor.executemany(project_insert_query, projects_data)
connection.commit()
print("Inserted into Project.")

# Insert data into Advertising table
print("Inserting into Advertising...")
advertising_insert_query = """
    INSERT INTO Advertising (advertising_id, clicks, budget, advertiser_id, conversion_rate, impressions)
    VALUES (%s, %s, %s, %s, %s, %s)
"""
advertising_data = [
    (str(uuid.uuid4()), random.randint(1000, 100000), random.randint(1000, 10000), str(uuid.uuid4()), random.randint(1, 100), random.randint(10000, 1000000))
    for _ in range(50)
]
cursor.executemany(advertising_insert_query, advertising_data)
connection.commit()
print("Inserted into Advertising.")


# Insert data into Transactions table
print("Inserting into Transactions...")
transactions_insert_query = """
    INSERT INTO Transactions (transaction_id, transaction_date, transaction_type, amount, payment_method)
    VALUES (%s, %s, %s, %s, %s)
"""
transactions_data = [
    (str(uuid.uuid4()), fake.date_this_year(), random.choice(['Purchase', 'Subscription']), random.randint(100, 1000), random.choice(['Credit Card', 'PayPal']))
    for _ in range(500000)
]

chunk_size = 5000
for i in range(0, len(transactions_data), chunk_size):
    cursor.executemany(transactions_insert_query, transactions_data[i:i + chunk_size])
    connection.commit()
    print(f"Inserted {i + chunk_size} rows into Transactions.")
print("Inserted into Transactions.")


# Insert data into Sessions table
print("Inserting into Sessions...")
sessions_insert_query = """
    INSERT INTO Sessions (session_id, session_start, session_end, device_type, location)
    VALUES (%s, %s, %s, %s, %s)
"""
sessions_data = [
    (str(uuid.uuid4()), fake.date_time_this_year(), fake.date_time_this_year(), random.choice(['iPhone', 'Android']), fake.city())
    for _ in range(2000000)
]
chunk_size = 5000
for i in range(0, len(sessions_data), chunk_size):
    cursor.executemany(sessions_insert_query, sessions_data[i:i + chunk_size])
    connection.commit()
    print(f"Inserted {i + chunk_size} rows into Sessions.")
print("Inserted into Sessions.")


# Insert data into Users table
print("Inserting into Users...")
users_insert_query = """
    INSERT INTO Users (user_id, nickname, user_email, monetary, registration_time, subscription_type, transaction_id, session_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
"""
users_data = [
    (str(uuid.uuid4()), fake.user_name(), fake.email(), random.randint(0, 10000), fake.date_this_decade(), random.choice(['Free', 'Premium']), random.choice(transactions_data)[0], random.choice(sessions_data)[0])
    for _ in range(50000)
]
chunk_size = 5000
for i in range(0, len(users_data), chunk_size):
    cursor.executemany(users_insert_query, users_data[i:i + chunk_size])
    connection.commit()
    print(f"Inserted {i + chunk_size} rows into Users.")
print("Inserted into Users.")


# Insert data into Apps table
print("Inserting into Apps...")
apps_insert_query = """
    INSERT INTO Apps (id, app_name, release_date, platform, status, project_id, user_id, advertising_id)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
"""
apps_data = [
    (str(uuid.uuid4()), fake.company(), fake.date_this_decade(), random.choice(['iOS', 'Android']), random.choice(['Released', 'In Development']), random.choice(projects_data)[0], random.choice(users_data)[0], random.choice(advertising_data)[0])
    for _ in range(500)
]
cursor.executemany(apps_insert_query, apps_data)
connection.commit()
print("Inserted into Apps.")

# Close the cursor and connection
cursor.close()
connection.close()
