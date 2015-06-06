'use strict';

module.exports = {
    addRoutes: addRoutes
};

// Add routes to the api
function addRoutes(api) {
    api.post('/transactions', createTransaction);
    api.put('/transactions/:id', updateTransaction);
    api.get('/transactions', getTransactions);
    api.get('/transactions/:id', getTransaction);
    api.delete('/transactions/:id', deleteTransaction);
}


var log = require('../../infrastructure/logger');
var domain = require('../../domain');
var application = require('../../application');
var Transaction = domain.Transaction;
var TransactionService = application.TransactionService;

// Creates a new transaction
function createTransaction(req, res) {

    var transactionData = req.body;
    transactionData.txn_date = new Date(transactionData.txn_date);

    TransactionService.createTransaction(transactionData)
        .then(function(transaction) {
            res.send(transaction);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Updates an existing transaction
function updateTransaction(req, res) {

    var transactionData = req.body;
    transactionData.txn_date = new Date(transactionData.txn_date);

    TransactionService.updateTransaction(transactionData)
        .then(function(transaction) {
            res.send(transaction);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Returns all transactions.
//
// optional query parameter: account
//     returns all transactions for the specified account
//
// optional query parameter: groupByCategory
//     returns an array of transactions grouped by category
//     requires two additional query parameters: startDate and endDate
//     Example: /transactions?groupByCategory&startDate=2014-01-01&endDate=2014-12-31
function getTransactions(req, res) {

    // Get query parameters
    var accountId = req.query.account;
    var groupByCategory = req.query.groupByCategory;
    var startDate = req.query.startDate;
    var endDate = req.query.endDate;

    // If start and end dates are defined, convert them to Date objects
    if (startDate) {
        startDate = new Date(startDate);
    }

    if (endDate) {
        endDate = new Date(endDate);
    }

    // Call TransactionService based on "groupByCategory" query parameter
    if (typeof groupByCategory !== 'undefined') {
        TransactionService.getTransactionsByCategory(startDate, endDate)
            .then(function(transactionsByCategory) {
                res.send(transactionsByCategory);
            })
            .catch(function(error) {
                log.error(error);
                res.status(500).send({'message': error.toString()});
            });
    }
    else {
        TransactionService.getTransactions(accountId)
            .then(function(transactions) {
                res.send(transactions);
            })
            .catch(function(error) {
                log.error(error);
                res.status(500).send({'message': error.toString()});
            });
    }
}

// Returns the specified transaction
function getTransaction(req, res) {

    var id = req.params.id;

    TransactionService.getTransaction(id)
        .then(function(transaction) {
            res.send(transaction);
        })
        .catch(Transaction.NotFoundError, function() {
            res.status(404).send({'message': 'Transaction ' + id + ' does not exist'});
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Deletes the specified transaction
function deleteTransaction(req, res) {

    var id = req.params.id;

    TransactionService.deleteTransaction(id)
        .then(function() {
            res.status(204).send();  // No Content
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}