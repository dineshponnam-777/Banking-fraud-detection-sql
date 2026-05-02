drop database if exists banking_project;
create database banking_project;
use banking_project;
create TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(12,2),
    transaction_type VARCHAR(20),
    transaction_time DATETIME,
    location VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE fraud_alerts (
    alert_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    reason VARCHAR(255),
    foreign key(transaction_id)
    references transactions(transaction_id)
);
CREATE TABLE risk_events (
    risk_id INT AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT,
    rule_code VARCHAR(20),
    severity VARCHAR(10),
    details TEXT,
    flagged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key(transaction_id)
    references transactions(transaction_id)
);
INSERT INTO risk_events (transaction_id, rule_code, severity, details)
SELECT transaction_id,
       'HIGH_AMT',
       'HIGH',
       'Transaction above 20000'
FROM transactions
WHERE amount > 20000;