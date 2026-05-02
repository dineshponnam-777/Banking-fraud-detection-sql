SELECT account_id,
       SUM(CASE 
           WHEN transaction_type = 'Debit' THEN amount 
           ELSE 0 END) AS total_debit
FROM transactions
GROUP BY account_id
HAVING total_debit > 20000;
SELECT account_id, COUNT(*) AS txn_count
FROM transactions
WHERE transaction_time >= NOW() - INTERVAL 10 MINUTE
GROUP BY account_id
HAVING COUNT(*) > 2;
SELECT account_id, COUNT(DISTINCT location) AS locations
FROM transactions
GROUP BY account_id
HAVING locations > 1;
SELECT *
FROM transactions
WHERE amount > 20000;
SELECT account_id,
       transaction_time,
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