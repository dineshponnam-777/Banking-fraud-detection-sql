drop VIEW if exists high_value_txn;
create view high_value_txn AS
SELECT transaction_id, account_id, amount
FROM transactions
WHERE amount > 8000;
SELECT account_id, COUNT(*) AS txn_count
FROM transactions
WHERE transaction_time >= NOW() - INTERVAL 10 MINUTE
GROUP BY account_id
HAVING COUNT(*) > 2;
SELECT account_id, COUNT(DISTINCT location) AS locations
FROM transactions
GROUP BY account_id
HAVING COUNT(DISTINCT location) > 1;
SELECT account_id, transaction_id, transaction_time,
SUM(
    CASE 
        WHEN transaction_type = 'Credit' THEN amount
        WHEN transaction_type = 'Debit' THEN -amount
    END
) OVER (PARTITION BY account_id ORDER BY transaction_time) AS balance
FROM transactions;
SELECT c.name, SUM(t.amount) AS total_txn
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
JOIN transactions t ON a.account_id = t.account_id
GROUP BY c.name
ORDER BY total_txn DESC;
SELECT account_id, COUNT(*) AS txn_count
FROM transactions
GROUP BY account_id
ORDER BY txn_count DESC;
SELECT reason,count(*) AS total_cases
FROM fraud_alerts
group by reason ;