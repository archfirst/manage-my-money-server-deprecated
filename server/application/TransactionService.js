'use strict';

module.exports = {
    createTransaction: createTransaction,
    updateTransaction: updateTransaction,
    getTransaction: getTransaction,
    getTransactions: getTransactions,
    getTransactionsByCategory: getTransactionsByCategory,
    deleteTransaction: deleteTransaction
};

var domain = require('../domain');
var knex = require('../infrastructure/orm').knex;
var Transaction = domain.Transaction;

// Creates a new transaction and inserts it in the database.
// transactionData example:
// {
//     txn_date: new Date('2015-02-01T00:00Z'),
//     payee: 'Chevron Gas Station',
//     memo: 'Gas',
//     amount: -30.00,
//     transaction_id: 3,
//     category_id: 1
// }
// Returns a promise which when fulfilled provides the inserted transaction with its id populated.
function createTransaction(transactionData) {
    return saveTransaction(transactionData);
}

// Updates an existing transaction. Full transaction data must be provided, including the id
// Returns a promise which when fulfilled provides the updated transaction.
// transactionData example:
// {
//     id: 1
//     txn_date: new Date('2015-02-01T00:00Z'),
//     payee: 'Chevron Gas Station',
//     memo: 'Gas',
//     amount: -30.00,
//     transaction_id: 3,
//     category_id: 1
// }
function updateTransaction(transactionData) {
    return saveTransaction(transactionData);
}

function saveTransaction(transactionData) {
    var transaction = new Transaction(transactionData);
    return transaction.save();
}

// Gets an existing transaction
// Returns a promise which when fulfilled provides the transaction.
function getTransaction(id) {
    return new Transaction({id: id}).fetch({require: true})
        .then(function(transaction) {
            return transaction.load([
                'account',
                'category'
            ]);
        });
}

/**
 * Gets all transactions.
 * @param {number} [accountId] returns transactions only for the specified account
 * @return {Promise} A promise that if resolved, returns an array of transactions
 */
function getTransactions(accountId) {

    var filterOptions = {};
    if (accountId) {
        filterOptions.account_id = accountId;
    }

    return Transaction
        .where(filterOptions)
        .fetchAll()
        .then(function(transactions) {
            return transactions.load([
                'account',
                'category'
            ]);
        });
}

/**
 * Gets transactions grouped by category.
 * @param {Date} [startDate] if startDate is specified then endDate must be specified
 * @param {Date} [endDate] if endDate is specified then startDate must be specified
 * @return {Promise} A promise that if resolved, returns an array of transactions grouped by category:
 * [
 *     { cat_id: 1, cat_name: 'Auto & Transport', amount: -1000.00 },
 *     { cat_id: 2, cat_name: 'Bills & Utilities', amount: -2000.00 },
 *     ...
 *     { cat_id: 8, cat_name: 'Salary', amount: 40000.00 },
 *     ...
 * ]
 */
function getTransactionsByCategory(startDate, endDate) {

    // Start a query builder
    var qb = knex
        .select(
            'c.id as cat_id',
            'c.name as cat_name',
            knex.raw('sum(t.amount) as amount'))
        .from('transactions as t')
        .leftOuterJoin('categories as c', 't.category_id', 'c.id');

    // Add optional start and end dates
    if (startDate && endDate) {
        qb = qb.whereBetween('t.txn_date', [startDate, endDate]);
    }

    // Finally add the groupBy clause
    qb = qb.groupBy('c.id');

    return qb;
}

// Deletes an existing transaction
// Returns a promise which when fulfilled deletes the transaction.
function deleteTransaction(id) {
    return new Transaction({id: id}).destroy();
}