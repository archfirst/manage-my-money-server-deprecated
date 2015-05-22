-- -----------------------------------------------------------------------------
-- categories
-- -----------------------------------------------------------------------------
INSERT INTO categories (id, name) VALUES ( 1, 'Auto & Transport');
INSERT INTO categories (id, name) VALUES ( 2, 'Entertainment');
INSERT INTO categories (id, name) VALUES ( 3, 'Food and Dining');
INSERT INTO categories (id, name) VALUES ( 4, 'Health & Fitness');
INSERT INTO categories (id, name) VALUES ( 5, 'Home Improvements');
INSERT INTO categories (id, name) VALUES ( 6, 'Personal Care');
INSERT INTO categories (id, name) VALUES ( 7, 'Salary');
INSERT INTO categories (id, name) VALUES ( 8, 'Shopping');
INSERT INTO categories (id, name) VALUES ( 9, 'Travel');
INSERT INTO categories (id, name) VALUES (10, 'Unallocated Income');
INSERT INTO categories (id, name) VALUES (11, 'Unallocated Expenses');
INSERT INTO categories (id, name) VALUES (12, 'Utilities');

SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories));

-- -----------------------------------------------------------------------------
-- accounts
-- -----------------------------------------------------------------------------
INSERT INTO accounts (id, name) VALUES (1, 'Cash');
INSERT INTO accounts (id, name) VALUES (2, 'BofA Checking');
INSERT INTO accounts (id, name) VALUES (3, 'Amazon VISA');

SELECT setval('accounts_id_seq', (SELECT MAX(id) FROM accounts));

-- -----------------------------------------------------------------------------
-- transactions
-- -----------------------------------------------------------------------------
INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (1, '2015-01-01 00:00:00Z', 'Opening Balance', NULL, 100.00, 1, 10);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (2, '2015-01-01 00:00:00Z', 'Opening Balance', NULL, 1000.00, 2, 10);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (3, '2015-01-01 00:00:00Z', 'Opening Balance', NULL, -200.00, 3, 11);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (4, '2015-01-02 00:00:00Z', 'Chevron Gas Station', 'Gas', -30.00, 3, 1);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (5, '2015-01-02 00:00:00Z', 'AMC Theatres', 'Batman', -12.00, 3, 2);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (6, '2015-01-02 00:00:00Z', 'b.good', NULL, -8.96, 1, 3);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (7, '2015-01-03 00:00:00Z', 'National Grid', NULL, -212.54, 2, 12);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (8, '2015-01-15 00:00:00Z', 'Sapient', 'Paycheck', 1012.33, 2, 7);

SELECT setval('transactions_id_seq', (SELECT MAX(id) FROM transactions));