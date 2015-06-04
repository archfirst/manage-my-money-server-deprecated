'use strict';

var mustache = require('mustache');
var _ = require('lodash');

var SimpleDate = require('./SimpleDate');
var accounts = require('./accounts');
var categories = require('./categories');
var transactionStore = require('./transaction-store');

// ----- Constants -----
var nextTxnId = 1;
var begDate = new SimpleDate(2013, 1,  1);
var endDate = new SimpleDate(2015, 5, 31);


// ----- Utilities -----
function generateHeader(title) {
    console.log('-- -----------------------------------------------------------------------------');
    console.log('-- ' + title);
    console.log('-- -----------------------------------------------------------------------------');
}

function setSequenceValue(table) {
    console.log();
    console.log("SELECT setval('" + table + "_id_seq', (SELECT MAX(id) FROM " + table + "));");
    console.log();
}


// ----- Categories -----
function generateCategories(categories) {

    // Prevent escaping of '&' etc. by using {{{unescaped_variable}}}
    var template =
        "INSERT INTO categories (id, name) VALUES ({{id}}, '{{{name}}}');";

    generateHeader('categories');

    _.each(categories, function(category) {
        console.log(mustache.render(template, category));
    });

    setSequenceValue('categories');
}


// ----- Accounts -----
function generateAccounts(accounts) {

    // Prevent escaping of '&' etc. by using {{{unescaped_variable}}}
    var template =
        "INSERT INTO accounts (id, name) VALUES ({{id}}, '{{{name}}}');";

    generateHeader('accounts');

    _.each(accounts, function(account) {
        console.log(mustache.render(template, account));
    });

    setSequenceValue('accounts');
}


// ----- Transactions -----
function generateTransaction(transaction) {

    transaction.id = nextTxnId++;
    transaction.txn_date = transaction.txn_simple_date.toString();

    var memo = transaction.memo;
    transaction.memo_str = memo ? ("'" + memo + "'") : "NULL";

    // Prevent escaping of '&' etc. by using {{{unescaped_variable}}}
    var template =
        "INSERT INTO transactions\n" +
        "(id, txn_date, payee, memo, amount, account_id, category_id)\n" +
        "VALUES ({{id}}, '{{txn_date}} 00:00:00Z', '{{{payee}}}', {{{memo_str}}}, {{amount}}, {{account_id}}, {{category_id}});\n";

    return mustache.render(template, transaction);
}

function generateOpeningBalances() {

    var transaction = {
        txn_simple_date: begDate,
        payee: 'Opening Balance',
        category_id: 16
    };

    _.each(transactionStore.openingBalances, function(openingBalance) {
        transaction.account_id = openingBalance.account_id;
        transaction.amount = openingBalance.amount;

        console.log(generateTransaction(transaction));
    });
}

function generatePaycheck(date) {
    var salary    = { txn_simple_date: date, payee: 'Hooli',                 amount:  8000.00, account_id: 3, category_id: 18 };
    var fedTax    = { txn_simple_date: date, payee: 'IRS',                   amount: -1200.00, account_id: 3, category_id: 19 };
    var stateTax  = { txn_simple_date: date, payee: 'State of California',   amount:  -800.00, account_id: 3, category_id: 19 };

    var xfer2HSA  = { txn_simple_date: date, payee: 'Transfer to HSA',       amount:  -500.00, account_id: 3, category_id: 20 };
    var xferFSvg1 = { txn_simple_date: date, payee: 'Transfer from Savings', amount:   500.00, account_id: 4, category_id: 20 };

    var xfer2401K = { txn_simple_date: date, payee: 'Transfer to 401K',      amount: -1500.00, account_id: 3, category_id: 20 };
    var xferFSvg2 = { txn_simple_date: date, payee: 'Transfer from Savings', amount:  1500.00, account_id: 9, category_id: 20 };

    var xfer2ETrd = { txn_simple_date: date, payee: 'Transfer to E*Trade',   amount: -1000.00, account_id: 3, category_id: 20 };
    var xferFSvg3 = { txn_simple_date: date, payee: 'Transfer from Savings', amount:  1000.00, account_id: 8, category_id: 20 };

    var xfer2Chkg = { txn_simple_date: date, payee: 'Transfer to Checking',  amount: -2500.00, account_id: 3, category_id: 20 };
    var xferFSvg4 = { txn_simple_date: date, payee: 'Transfer from Savings', amount:  2500.00, account_id: 2, category_id: 20 };

    var xfer2Cash = { txn_simple_date: date, payee: 'Transfer to Cash',      amount:  -200.00, account_id: 3, category_id: 20 };
    var xferFSvg5 = { txn_simple_date: date, payee: 'Transfer from Savings', amount:   200.00, account_id: 1, category_id: 20 };

    console.log(generateTransaction(salary));
    console.log(generateTransaction(fedTax));
    console.log(generateTransaction(stateTax));
    console.log(generateTransaction(xfer2HSA));
    console.log(generateTransaction(xferFSvg1));
    console.log(generateTransaction(xfer2401K));
    console.log(generateTransaction(xferFSvg2));
    console.log(generateTransaction(xfer2ETrd));
    console.log(generateTransaction(xferFSvg3));
    console.log(generateTransaction(xfer2Chkg));
    console.log(generateTransaction(xferFSvg4));
    console.log(generateTransaction(xfer2Cash));
    console.log(generateTransaction(xferFSvg5));
}

function generatePaychecks() {

    var date = begDate.clone();
    date.dd = 28;  // change pay day to 28th of the month

    for ( ; date.lte(endDate); date.addMonth() ) {
        generatePaycheck(date);
    }
}

function generateTransactions() {
    generateHeader('transactions');
    generateOpeningBalances();
    generatePaychecks();
    setSequenceValue('transactions');
}


// ----- Main -----
generateCategories(categories);
generateAccounts(accounts);
generateTransactions();
