'use strict';

module.exports = {
    createAccount: createAccount,
    updateAccount: updateAccount,
    getAccount: getAccount,
    getAccounts: getAccounts,
    deleteAccount: deleteAccount
};

var domain = require('../domain');
var Account = domain.Account;

// Creates a new account and inserts it in the database.
// accountData example:
// {
//     name: 'Cash'
// }
// Returns a promise which when fulfilled provides the inserted account with its id populated.
function createAccount(accountData) {
    return saveAccount(accountData);
}

// Updates an existing account. Full account data must be provided, including the id
// Returns a promise which when fulfilled provides the updated account.
// accountData example:
// {
//     id: 1
//     name: 'Cash'
// }
function updateAccount(accountData) {
    return saveAccount(accountData);
}

function saveAccount(accountData) {
    var account = new Account(accountData);
    return account.save();
}

// Gets an existing account
// Returns a promise which when fulfilled provides the account.
function getAccount(id) {
    return new Account({id: id}).fetch({require: true});
}

// Gets all accounts
// Returns a promise which when fulfilled provides an array of accounts.
function getAccounts() {
    return Account.fetchAll();
}

// Deletes an existing account
// Returns a promise which when fulfilled deletes the account.
function deleteAccount(id) {
    return new Account({id: id}).destroy();
}