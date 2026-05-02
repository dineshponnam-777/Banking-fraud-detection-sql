use banking_project;
INSERT INTO customers (name, city)
VALUES 
('Ravi Kumar', 'Hyderabad'),
('Anjali Sharma', 'Delhi'),
('Priya Reddy','Hyderabad'),
('Amit Verma','Delhi'),
('Sneha Iyer','Chennai'),
('Vikram Singh','Pune'),
('Anjali Mehta','Ahmedabad'),
('Karan Patel','Surat'),
('Neha Gupta','Noida'),
('Arjun Nair','Kochi'),
('Pooja Kapoor','Chandigarh'),
('Rohit Jain','Jaipur'),
('Meera Das','Kolkata'),
('Suresh Kumar','Lucknow'),
('Divya Sharma','Indore'),
('Manoj Yadav','Patna'),
('Kavya Shetty','Mangalore'),
('Nikhil Agarwal','Bhopal'),
('Ritu Saxena','Kanpur'),
('Harish Rao','Vizag'),
('Deepika Sen','Nagpur');
INSERT INTO accounts (customer_id, account_type, balance)
VALUES
(1,'Savings',50000.00),
(2,'Current',75000.00),
(3,'Current',75000.00),
(4,'Savings',43000.00),
(5,'Current',88000.00),
(6,'Savings',54000.00),
(7,'Savings',47000.00),
(8,'Current',91000.00),
(9,'Savings',35000.00),
(10,'Savings',67000.00),
(11,'Current',82000.00),
(12,'Savings',39000.00),
(13,'Savings',72000.00),
(14,'Current',66000.00),
(15,'Savings',58000.00),
(16,'Savings',61000.00),
(17,'Current',77000.00),
(18,'Savings',45000.00),
(19,'Savings',53000.00),
(20,'Current',99000.00);
INSERT INTO transactions (account_id, amount, transaction_type, transaction_time, location)
VALUES
(1,5000,'Debit',NOW(),'Mumbai'),
(1,12000,'Debit',NOW(),'Mumbai'),
(1,3000,'Credit',NOW(),'Mumbai'),
(1,8000,'Debit',NOW(),'Delhi'),

(2,10000,'Credit',NOW(),'Hyderabad'),
(2,7000,'Debit',NOW(),'Hyderabad'),
(2,15000,'Debit',NOW(),'Bangalore'),
(2,4000,'Credit',NOW(),'Hyderabad'),

(3,20000,'Debit',NOW(),'Delhi'),
(3,5000,'Credit',NOW(),'Delhi'),
(3,12000,'Debit',NOW(),'Noida'),

(4,6000,'Debit',NOW(),'Chennai'),
(4,2000,'Credit',NOW(),'Chennai'),
(4,9000,'Debit',NOW(),'Bangalore'),

(5,25000,'Debit',NOW(),'Pune'),
(5,10000,'Credit',NOW(),'Mumbai'),
(5,30000,'Debit',NOW(),'Delhi'),

(6,8000,'Credit',NOW(),'Ahmedabad'),
(6,11000,'Debit',NOW(),'Surat'),

(7,4000,'Debit',NOW(),'Surat'),
(7,6000,'Credit',NOW(),'Surat'),
(7,9000,'Debit',NOW(),'Mumbai'),

(8,20000,'Debit',NOW(),'Noida'),
(8,10000,'Credit',NOW(),'Delhi'),
(8,5000,'Debit',NOW(),'Delhi'),

(9,3500,'Debit',NOW(),'Kochi'),
(9,8000,'Debit',NOW(),'Chennai'),

(10,6000,'Credit',NOW(),'Chandigarh'),
(10,9000,'Debit',NOW(),'Delhi'),

(11,25000,'Debit',NOW(),'Jaipur'),
(11,5000,'Credit',NOW(),'Jaipur'),

(12,3000,'Debit',NOW(),'Kolkata'),
(12,7000,'Credit',NOW(),'Kolkata'),

(13,15000,'Debit',NOW(),'Lucknow'),
(13,5000,'Credit',NOW(),'Lucknow'),

(14,12000,'Debit',NOW(),'Indore'),
(14,8000,'Credit',NOW(),'Indore'),

(15,10000,'Debit',NOW(),'Patna'),
(15,2000,'Credit',NOW(),'Patna'),

(16,9000,'Debit',NOW(),'Mangalore'),
(16,5000,'Credit',NOW(),'Mangalore'),

(17,22000,'Debit',NOW(),'Bhopal'),
(17,7000,'Credit',NOW(),'Bhopal'),

(18,4500,'Debit',NOW(),'Kanpur'),
(18,3000,'Credit',NOW(),'Kanpur'),

(19,8000,'Debit',NOW(),'Vizag'),
(19,6000,'Credit',NOW(),'Vizag'),

(20,30000,'Debit',NOW(),'Nagpur'),
(20,15000,'Credit',NOW(),'Nagpur');
INSERT INTO fraud_alerts (transaction_id, reason)
VALUES
(1, 'Unusual large transaction'),
(2, 'Different location detected'),
(3,'High frequency transaction'),
(7,'Different location detected'),
(12,'Unusual large transaction'),
(18,'Suspicious pattern'),
(25,'Multiple withdrawals'),
(30,'Large amount transfer'),
(35,'Different location detected'),
(40,'High-risk account');