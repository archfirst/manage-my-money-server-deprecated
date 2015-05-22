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

// Returns all transactions
function getTransactions(req, res) {
    TransactionService.getTransactions()
        .then(function(transactions) {
            res.send(transactions);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Returns the transaction
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