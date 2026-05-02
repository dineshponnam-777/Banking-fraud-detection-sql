USE banking_project;

DROP TRIGGER IF EXISTS trg_high_amount;

DELIMITER $$

CREATE TRIGGER trg_high_amount
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.amount >= 20000 THEN
        INSERT INTO risk_events (
            transaction_id,
            rule_code,
            severity,
            details
        )
        VALUES (
            NEW.transaction_id,
            'HIGH_AMT',
            'HIGH',
            CONCAT('High transaction amount: ', NEW.amount)
        );
    END IF;
END$$

DELIMITER ;


use banking_project;
DELIMITER $$

CREATE TRIGGER trg_high_frequency
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE txn_count INT;

    SELECT COUNT(*) INTO txn_count
    FROM transactions
    WHERE account_id = NEW.account_id
    AND transaction_time >= NOW() - INTERVAL 10 MINUTE;

    IF txn_count > 3 THEN
        INSERT INTO risk_events (
            transaction_id,
            rule_code,
            severity,
            details
        )
        VALUES (
            NEW.transaction_id,
            'HIGH_FREQ',
            'MEDIUM',
            'Multiple transactions in short time'
        );
    END IF;
END$$

DELIMITER ;