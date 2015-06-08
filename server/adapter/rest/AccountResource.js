'use strict';

module.exports = {
    addRoutes: addRoutes
};

/**
 * Adds routes to the api.
 */
function addRoutes(api) {
    api.post('/accounts', createAccount);
    api.put('/accounts/:id', updateAccount);
    api.get('/accounts', getAccounts);
    api.get('/accounts/:id', getAccount);
    api.delete('/accounts/:id', deleteAccount);
}


var log = require('../../infrastructure/logger');
var domain = require('../../domain');
var application = require('../../application');

var Account = domain.Account;
var AccountService = application.AccountService;

/**
 * Creates a new account.
 */
function createAccount(req, res) {

    var accountData = req.body;

    AccountService.createAccount(accountData)
        .then(function(account) {
            res.send(account);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

/**
 * Updates an existing account.
 */
function updateAccount(req, res) {

    var accountData = req.body;

    AccountService.updateAccount(accountData)
        .then(function(account) {
            res.send(account);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

/**
 * Gets an existing account.
 */
function getAccount(req, res) {

    var id = req.params.id;

    AccountService.getAccount(id)
        .then(function(account) {
            res.send(account);
        })
        .catch(Account.NotFoundError, function() {
            res.status(404).send({'message': 'Account ' + id + ' does not exist'});
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

/**
 * Gets all accounts.
 */
function getAccounts(req, res) {
    AccountService.getAccounts()
        .then(function(accounts) {
            res.send(accounts);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

/**
 * Deletes an account.
 */
function deleteAccount(req, res) {

    var id = req.params.id;

    AccountService.deleteAccount(id)
        .then(function() {
            res.status(204).send();  // No Content
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}
