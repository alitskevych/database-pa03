CREATE TABLE Finances (
    finance_id VARCHAR(255) PRIMARY KEY,
    revenue BIGINT,
    expenses BIGINT,
    net_profit BIGINT,
    payment_date DATETIME
);

ALTER TABLE Finances
MODIFY column finance_id VARCHAR(255) COMMENT 'Unique ID for each finance record',
MODIFY column revenue BIGINT COMMENT 'Total revenue generated for the project',
MODIFY column expenses BIGINT COMMENT 'Total expenses for the project',
MODIFY column net_profit BIGINT COMMENT 'Net profit calculated as revenue minus expenses',
MODIFY column payment_date DATETIME COMMENT 'Date when payment was made';

CREATE TABLE Project (
    project_id VARCHAR(255) PRIMARY KEY,
    project_name VARCHAR(255),
    start_date DATETIME,
    end_date DATETIME,
    budget BIGINT,
    status VARCHAR(50),
    description VARCHAR(255),
    finance_id VARCHAR(255),
    worker_id VARCHAR(255),
    FOREIGN KEY (finance_id) REFERENCES Finances (finance_id),
    FOREIGN KEY (worker_id) REFERENCES Workers (worker_id)
);

ALTER TABLE Project
MODIFY column project_id VARCHAR(255) COMMENT 'Unique ID for each project',
MODIFY column project_name VARCHAR(255) COMMENT 'Name of the project',
MODIFY column start_date DATETIME COMMENT 'Project start date',
MODIFY column end_date DATETIME COMMENT 'Project end date',
MODIFY column budget BIGINT COMMENT 'Budget allocated for the project',
MODIFY column status VARCHAR(50) COMMENT 'Current status of the project (e.g., In Progress, Completed)',
MODIFY column description VARCHAR(255) COMMENT 'Detailed description of the project',
MODIFY column finance_id VARCHAR(255) COMMENT 'Foreign key linking to the Finances table',
MODIFY column worker_id VARCHAR(255) COMMENT 'Foreign key linking to the Workers table';



CREATE TABLE Workers (
    worker_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    phone_number VARCHAR(100),
    worker_role VARCHAR(100),
    hire_date DATETIME,
    employment_status VARCHAR(50),
    salary BIGINT
);

ALTER TABLE Workers
MODIFY column worker_id VARCHAR(255) COMMENT 'Unique ID for each worker',
MODIFY column first_name VARCHAR(100) COMMENT 'Worker\'s first name',
MODIFY column last_name VARCHAR(100) COMMENT 'Worker\'s last name',
MODIFY column phone_number VARCHAR(100) COMMENT 'Contact phone number of the worker',
MODIFY column worker_role VARCHAR(100) COMMENT 'Job role of the worker (e.g., Developer, Designer)',
MODIFY column hire_date DATETIME COMMENT 'Date when the worker was hired',
MODIFY column employment_status VARCHAR(50) COMMENT 'Employment type (e.g., Full-Time, Part-Time, Contractor)',
MODIFY column salary BIGINT COMMENT 'Salary or hourly rate of the worker';



CREATE TABLE Advertising (
    advertising_id VARCHAR(255) PRIMARY KEY,
    clicks BIGINT,
    budget BIGINT,
    advertiser_id VARCHAR(255),
    conversion_rate BIGINT,
    impressions BIGINT
);

ALTER TABLE Advertising
MODIFY column advertising_id VARCHAR(255) COMMENT 'Unique ID for each advertising campaign',
MODIFY column clicks BIGINT COMMENT 'Number of clicks generated by the advertisement',
MODIFY column budget BIGINT COMMENT 'Budget allocated for the advertising campaign',
MODIFY column advertiser_id VARCHAR(255) COMMENT 'ID of the advertiser who owns the campaign',
MODIFY column conversion_rate BIGINT COMMENT 'Percentage of conversions from the advertisement',
MODIFY column impressions BIGINT COMMENT 'Total number of impressions for the advertisement';


CREATE TABLE Apps (
    id VARCHAR(255) PRIMARY KEY,
    app_name VARCHAR(255),
    release_date DATE,
    platform VARCHAR(100),
    status VARCHAR(50),
    project_id VARCHAR(255),
    user_id VARCHAR(255),
    advertising_id VARCHAR(255),
    FOREIGN KEY (project_id) REFERENCES Project(project_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (advertising_id) REFERENCES Advertising(advertising_id)
);

ALTER TABLE Apps
MODIFY column id VARCHAR(255) COMMENT 'Unique ID for each app',
MODIFY column app_name VARCHAR(255) COMMENT 'Name of the app',
MODIFY column release_date DATE COMMENT 'Release date of the app',
MODIFY column platform VARCHAR(100) COMMENT 'Platform the app runs on (e.g., iOS, Android)',
MODIFY column status VARCHAR(50) COMMENT 'Current status of the app (e.g., Released, In Development)',
MODIFY column project_id VARCHAR(255) COMMENT 'Foreign key linking to the Project table',
MODIFY column user_id VARCHAR(255) COMMENT 'Foreign key linking to the Users table (app owner)',
MODIFY column advertising_id VARCHAR(255) COMMENT 'Foreign key linking to the Advertising table';



CREATE TABLE Users (
    user_id VARCHAR(255) PRIMARY KEY,
    nickname VARCHAR(255),
    user_email VARCHAR(255),
    monetary BIGINT,
    registration_time DATETIME,
    subscription_type VARCHAR(50),
    transaction_id VARCHAR(255),
    session_id VARCHAR(255),
    FOREIGN KEY (transaction_id) REFERENCES Transactions(transaction_id),
    FOREIGN KEY (session_id) REFERENCES Sessions(session_id)
);

ALTER TABLE Users
MODIFY column user_id VARCHAR(255) COMMENT 'Unique ID for each user',
MODIFY column nickname VARCHAR(255) COMMENT 'User\'s chosen nickname',
MODIFY column user_email VARCHAR(255) COMMENT 'User\'s email address',
MODIFY column monetary BIGINT COMMENT 'User\'s monetary balance',
MODIFY column registration_time DATETIME COMMENT 'Time when the user registered',
MODIFY column subscription_type VARCHAR(50) COMMENT 'Subscription type of the user (e.g., Free, Premium)',
MODIFY column transaction_id VARCHAR(255) COMMENT 'Foreign key linking to the Transactions table',
MODIFY column session_id VARCHAR(255) COMMENT 'Foreign key linking to the Sessions table';


CREATE TABLE Transactions (
    transaction_id VARCHAR(255) PRIMARY KEY,
    transaction_date DATETIME,
    transaction_type VARCHAR(50),
    amount BIGINT,
    payment_method VARCHAR(50)
);

ALTER TABLE Transactions
MODIFY column transaction_id VARCHAR(255) COMMENT 'Unique ID for each transaction',
MODIFY column transaction_date DATETIME COMMENT 'Date and time of the transaction',
MODIFY column transaction_type VARCHAR(50) COMMENT 'Type of transaction (e.g., Purchase, Subscription)',
MODIFY column amount BIGINT COMMENT 'Amount involved in the transaction',
MODIFY column payment_method VARCHAR(50) COMMENT 'Method of payment (e.g., Credit Card, PayPal)';



CREATE TABLE Sessions (
    session_id VARCHAR(255) PRIMARY KEY,
    session_start DATETIME,
    session_end DATETIME,
    device_type VARCHAR(100),
    location VARCHAR(255)
);

ALTER TABLE Sessions
MODIFY column session_id VARCHAR(255) COMMENT 'Unique ID for each user session',
MODIFY column session_start DATETIME COMMENT 'Time when the session started',
MODIFY column session_end DATETIME COMMENT 'Time when the session ended',
MODIFY column device_type VARCHAR(100) COMMENT 'Type of device used during the session (e.g., iPhone, Android)',
MODIFY column location VARCHAR(255) COMMENT 'Location of the user during the session';