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

/**
 * Creates a new account and inserts it in to the database.
 * @param {Object} accountData - Full account data, excluding the id. For example:
 * {
 *     name: 'Cash'
 * }
 * @return {Promise} A promise that returns a full copy of the inserted account (including the id) on fulfillment.
 */
function createAccount(accountData) {
    return saveAccount(accountData);
}

/**
 * Updates an existing account.
 * @param {Object} accountData - Full account data, including the id. For example:
 * {
 *     id: 1,
 *     name: 'Cash'
 * }
 * @return {Promise} A promise that returns a full copy of the updated account on fulfillment.
 */
function updateAccount(accountData) {
    return saveAccount(accountData);
}

/**
 * Inserts or updates an account depending on whether the account has an `id` or not.
 * @param {Object} accountData - Full account data, except `id` is optional.
 * @return {Promise} A promise that returns a full copy of the account on fulfillment.
 */
function saveAccount(accountData) {
    var account = new Account(accountData);
    return account.save();
}

/**
 * Gets an existing account.
 * @param {integer} id
 * @return {Promise} A promise that returns the desired account on fulfillment.
 */
function getAccount(id) {
    return new Account({id: id}).fetch({require: true});
}

/**
 * Gets all accounts.
 * @return {Promise} A promise that returns an array of all accounts on fulfillment.
 */
function getAccounts() {
    return Account.fetchAll();
}

/**
 * Deletes an account.
 * @param {integer} id
 * @return {Promise} A promise that gets fulfilled when the account is deleted.
 */
function deleteAccount(id) {
    return new Account({id: id}).destroy();
}
