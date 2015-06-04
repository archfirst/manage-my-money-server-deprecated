-- -----------------------------------------------------------------------------
-- categories
-- -----------------------------------------------------------------------------
INSERT INTO categories (id, name) VALUES (1, 'Auto & Transport');
INSERT INTO categories (id, name) VALUES (2, 'Bills & Utilities');
INSERT INTO categories (id, name) VALUES (3, 'Business Services');
INSERT INTO categories (id, name) VALUES (4, 'Dividends');
INSERT INTO categories (id, name) VALUES (5, 'Education');
INSERT INTO categories (id, name) VALUES (6, 'Entertainment');
INSERT INTO categories (id, name) VALUES (7, 'Fees & Charges');
INSERT INTO categories (id, name) VALUES (8, 'Financial');
INSERT INTO categories (id, name) VALUES (9, 'Food & Dining');
INSERT INTO categories (id, name) VALUES (10, 'Gift & Donations');
INSERT INTO categories (id, name) VALUES (11, 'Health & Fitness');
INSERT INTO categories (id, name) VALUES (12, 'Home');
INSERT INTO categories (id, name) VALUES (13, 'Interest Income');
INSERT INTO categories (id, name) VALUES (14, 'Investments - Buy');
INSERT INTO categories (id, name) VALUES (15, 'Investments - Sell');
INSERT INTO categories (id, name) VALUES (16, 'Opening Balance');
INSERT INTO categories (id, name) VALUES (17, 'Personal Care');
INSERT INTO categories (id, name) VALUES (18, 'Salary');
INSERT INTO categories (id, name) VALUES (19, 'Taxes');
INSERT INTO categories (id, name) VALUES (20, 'Transfer');
INSERT INTO categories (id, name) VALUES (21, 'Travel');
INSERT INTO categories (id, name) VALUES (22, 'Unallocated Expense');
INSERT INTO categories (id, name) VALUES (23, 'Unallocated Income');

SELECT setval('categories_id_seq', (SELECT MAX(id) FROM categories));

-- -----------------------------------------------------------------------------
-- accounts
-- -----------------------------------------------------------------------------
INSERT INTO accounts (id, name) VALUES (1, 'Cash');
INSERT INTO accounts (id, name) VALUES (2, 'BofA Checking');
INSERT INTO accounts (id, name) VALUES (3, 'E*Trade Savings');
INSERT INTO accounts (id, name) VALUES (4, 'UnitedHealthcare HSA');
INSERT INTO accounts (id, name) VALUES (5, 'FIA Card Services');
INSERT INTO accounts (id, name) VALUES (6, 'Amazon VISA');
INSERT INTO accounts (id, name) VALUES (7, 'AmEx Platinum');
INSERT INTO accounts (id, name) VALUES (8, 'E*Trade Brokerage');
INSERT INTO accounts (id, name) VALUES (9, 'Fidelity 401K');
INSERT INTO accounts (id, name) VALUES (10, 'Betterment');

SELECT setval('accounts_id_seq', (SELECT MAX(id) FROM accounts));

-- -----------------------------------------------------------------------------
-- transactions
-- -----------------------------------------------------------------------------
INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (1, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 100, 1, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (2, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 1000, 2, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (3, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 5000, 3, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (4, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 3000, 4, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (5, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, -3600, 5, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (6, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, -200, 6, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (7, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, -800, 7, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (8, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 50000, 8, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (9, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 70000, 9, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (10, '2013-01-01 00:00:00Z', 'Opening Balance', NULL, 10000, 10, 16);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (11, '2013-01-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (12, '2013-01-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (13, '2013-01-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (14, '2013-01-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (15, '2013-01-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (16, '2013-01-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (17, '2013-01-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (18, '2013-01-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (19, '2013-01-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (20, '2013-01-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (21, '2013-01-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (22, '2013-01-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (23, '2013-01-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (24, '2013-02-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (25, '2013-02-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (26, '2013-02-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (27, '2013-02-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (28, '2013-02-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (29, '2013-02-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (30, '2013-02-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (31, '2013-02-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (32, '2013-02-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (33, '2013-02-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (34, '2013-02-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (35, '2013-02-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (36, '2013-02-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (37, '2013-03-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (38, '2013-03-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (39, '2013-03-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (40, '2013-03-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (41, '2013-03-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (42, '2013-03-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (43, '2013-03-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (44, '2013-03-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (45, '2013-03-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (46, '2013-03-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (47, '2013-03-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (48, '2013-03-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (49, '2013-03-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (50, '2013-04-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (51, '2013-04-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (52, '2013-04-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (53, '2013-04-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (54, '2013-04-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (55, '2013-04-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (56, '2013-04-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (57, '2013-04-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (58, '2013-04-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (59, '2013-04-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (60, '2013-04-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (61, '2013-04-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (62, '2013-04-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (63, '2013-05-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (64, '2013-05-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (65, '2013-05-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (66, '2013-05-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (67, '2013-05-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (68, '2013-05-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (69, '2013-05-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (70, '2013-05-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (71, '2013-05-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (72, '2013-05-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (73, '2013-05-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (74, '2013-05-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (75, '2013-05-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (76, '2013-06-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (77, '2013-06-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (78, '2013-06-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (79, '2013-06-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (80, '2013-06-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (81, '2013-06-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (82, '2013-06-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (83, '2013-06-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (84, '2013-06-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (85, '2013-06-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (86, '2013-06-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (87, '2013-06-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (88, '2013-06-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (89, '2013-07-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (90, '2013-07-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (91, '2013-07-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (92, '2013-07-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (93, '2013-07-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (94, '2013-07-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (95, '2013-07-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (96, '2013-07-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (97, '2013-07-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (98, '2013-07-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (99, '2013-07-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (100, '2013-07-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (101, '2013-07-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (102, '2013-08-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (103, '2013-08-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (104, '2013-08-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (105, '2013-08-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (106, '2013-08-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (107, '2013-08-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (108, '2013-08-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (109, '2013-08-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (110, '2013-08-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (111, '2013-08-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (112, '2013-08-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (113, '2013-08-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (114, '2013-08-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (115, '2013-09-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (116, '2013-09-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (117, '2013-09-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (118, '2013-09-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (119, '2013-09-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (120, '2013-09-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (121, '2013-09-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (122, '2013-09-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (123, '2013-09-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (124, '2013-09-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (125, '2013-09-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (126, '2013-09-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (127, '2013-09-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (128, '2013-10-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (129, '2013-10-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (130, '2013-10-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (131, '2013-10-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (132, '2013-10-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (133, '2013-10-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (134, '2013-10-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (135, '2013-10-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (136, '2013-10-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (137, '2013-10-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (138, '2013-10-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (139, '2013-10-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (140, '2013-10-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (141, '2013-11-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (142, '2013-11-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (143, '2013-11-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (144, '2013-11-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (145, '2013-11-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (146, '2013-11-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (147, '2013-11-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (148, '2013-11-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (149, '2013-11-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (150, '2013-11-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (151, '2013-11-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (152, '2013-11-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (153, '2013-11-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (154, '2013-12-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (155, '2013-12-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (156, '2013-12-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (157, '2013-12-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (158, '2013-12-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (159, '2013-12-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (160, '2013-12-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (161, '2013-12-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (162, '2013-12-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (163, '2013-12-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (164, '2013-12-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (165, '2013-12-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (166, '2013-12-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (167, '2014-01-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (168, '2014-01-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (169, '2014-01-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (170, '2014-01-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (171, '2014-01-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (172, '2014-01-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (173, '2014-01-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (174, '2014-01-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (175, '2014-01-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (176, '2014-01-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (177, '2014-01-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (178, '2014-01-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (179, '2014-01-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (180, '2014-02-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (181, '2014-02-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (182, '2014-02-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (183, '2014-02-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (184, '2014-02-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (185, '2014-02-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (186, '2014-02-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (187, '2014-02-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (188, '2014-02-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (189, '2014-02-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (190, '2014-02-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (191, '2014-02-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (192, '2014-02-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (193, '2014-03-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (194, '2014-03-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (195, '2014-03-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (196, '2014-03-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (197, '2014-03-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (198, '2014-03-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (199, '2014-03-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (200, '2014-03-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (201, '2014-03-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (202, '2014-03-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (203, '2014-03-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (204, '2014-03-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (205, '2014-03-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (206, '2014-04-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (207, '2014-04-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (208, '2014-04-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (209, '2014-04-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (210, '2014-04-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (211, '2014-04-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (212, '2014-04-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (213, '2014-04-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (214, '2014-04-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (215, '2014-04-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (216, '2014-04-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (217, '2014-04-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (218, '2014-04-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (219, '2014-05-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (220, '2014-05-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (221, '2014-05-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (222, '2014-05-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (223, '2014-05-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (224, '2014-05-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (225, '2014-05-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (226, '2014-05-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (227, '2014-05-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (228, '2014-05-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (229, '2014-05-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (230, '2014-05-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (231, '2014-05-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (232, '2014-06-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (233, '2014-06-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (234, '2014-06-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (235, '2014-06-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (236, '2014-06-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (237, '2014-06-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (238, '2014-06-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (239, '2014-06-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (240, '2014-06-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (241, '2014-06-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (242, '2014-06-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (243, '2014-06-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (244, '2014-06-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (245, '2014-07-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (246, '2014-07-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (247, '2014-07-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (248, '2014-07-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (249, '2014-07-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (250, '2014-07-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (251, '2014-07-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (252, '2014-07-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (253, '2014-07-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (254, '2014-07-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (255, '2014-07-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (256, '2014-07-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (257, '2014-07-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (258, '2014-08-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (259, '2014-08-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (260, '2014-08-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (261, '2014-08-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (262, '2014-08-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (263, '2014-08-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (264, '2014-08-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (265, '2014-08-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (266, '2014-08-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (267, '2014-08-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (268, '2014-08-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (269, '2014-08-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (270, '2014-08-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (271, '2014-09-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (272, '2014-09-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (273, '2014-09-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (274, '2014-09-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (275, '2014-09-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (276, '2014-09-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (277, '2014-09-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (278, '2014-09-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (279, '2014-09-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (280, '2014-09-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (281, '2014-09-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (282, '2014-09-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (283, '2014-09-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (284, '2014-10-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (285, '2014-10-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (286, '2014-10-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (287, '2014-10-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (288, '2014-10-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (289, '2014-10-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (290, '2014-10-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (291, '2014-10-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (292, '2014-10-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (293, '2014-10-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (294, '2014-10-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (295, '2014-10-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (296, '2014-10-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (297, '2014-11-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (298, '2014-11-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (299, '2014-11-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (300, '2014-11-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (301, '2014-11-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (302, '2014-11-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (303, '2014-11-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (304, '2014-11-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (305, '2014-11-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (306, '2014-11-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (307, '2014-11-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (308, '2014-11-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (309, '2014-11-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (310, '2014-12-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (311, '2014-12-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (312, '2014-12-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (313, '2014-12-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (314, '2014-12-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (315, '2014-12-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (316, '2014-12-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (317, '2014-12-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (318, '2014-12-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (319, '2014-12-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (320, '2014-12-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (321, '2014-12-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (322, '2014-12-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (323, '2015-01-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (324, '2015-01-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (325, '2015-01-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (326, '2015-01-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (327, '2015-01-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (328, '2015-01-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (329, '2015-01-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (330, '2015-01-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (331, '2015-01-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (332, '2015-01-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (333, '2015-01-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (334, '2015-01-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (335, '2015-01-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (336, '2015-02-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (337, '2015-02-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (338, '2015-02-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (339, '2015-02-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (340, '2015-02-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (341, '2015-02-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (342, '2015-02-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (343, '2015-02-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (344, '2015-02-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (345, '2015-02-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (346, '2015-02-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (347, '2015-02-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (348, '2015-02-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (349, '2015-03-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (350, '2015-03-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (351, '2015-03-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (352, '2015-03-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (353, '2015-03-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (354, '2015-03-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (355, '2015-03-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (356, '2015-03-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (357, '2015-03-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (358, '2015-03-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (359, '2015-03-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (360, '2015-03-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (361, '2015-03-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (362, '2015-04-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (363, '2015-04-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (364, '2015-04-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (365, '2015-04-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (366, '2015-04-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (367, '2015-04-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (368, '2015-04-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (369, '2015-04-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (370, '2015-04-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (371, '2015-04-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (372, '2015-04-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (373, '2015-04-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (374, '2015-04-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (375, '2015-05-28 00:00:00Z', 'Hooli', NULL, 8000, 3, 18);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (376, '2015-05-28 00:00:00Z', 'IRS', NULL, -1200, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (377, '2015-05-28 00:00:00Z', 'State of California', NULL, -800, 3, 19);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (378, '2015-05-28 00:00:00Z', 'Transfer to HSA', NULL, -500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (379, '2015-05-28 00:00:00Z', 'Transfer from Savings', NULL, 500, 4, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (380, '2015-05-28 00:00:00Z', 'Transfer to 401K', NULL, -1500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (381, '2015-05-28 00:00:00Z', 'Transfer from Savings', NULL, 1500, 9, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (382, '2015-05-28 00:00:00Z', 'Transfer to E*Trade', NULL, -1000, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (383, '2015-05-28 00:00:00Z', 'Transfer from Savings', NULL, 1000, 8, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (384, '2015-05-28 00:00:00Z', 'Transfer to Checking', NULL, -2500, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (385, '2015-05-28 00:00:00Z', 'Transfer from Savings', NULL, 2500, 2, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (386, '2015-05-28 00:00:00Z', 'Transfer to Cash', NULL, -200, 3, 20);

INSERT INTO transactions
(id, txn_date, payee, memo, amount, account_id, category_id)
VALUES (387, '2015-05-28 00:00:00Z', 'Transfer from Savings', NULL, 200, 1, 20);


SELECT setval('transactions_id_seq', (SELECT MAX(id) FROM transactions));

