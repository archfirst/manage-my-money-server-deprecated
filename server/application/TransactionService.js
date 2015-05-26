'use strict';

module.exports = {
    createTransaction: createTransaction,
    updateTransaction: updateTransaction,
    getTransaction: getTransaction,
    getTransactions: getTransactions,
    deleteTransaction: deleteTransaction
};

var domain = require('../domain');
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

// Gets all transactions
// account_id: optional - returns transactions only for the specified account
// Returns a promise which when fulfilled provides an array of transactions.
function getTransactions(account_id) {

    var options = {};
    if (account_id) {
        options.account_id = account_id;
    }

    return Transaction
        .where(options)
        .fetchAll()
        .then(function(transactions) {
            return transactions.load([
                'account',
                'category'
            ]);
        });
}

// Deletes an existing transaction
// Returns a promise which when fulfilled deletes the transaction.
function deleteTransaction(id) {
    return new Transaction({id: id}).destroy();
}