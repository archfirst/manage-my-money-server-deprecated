/* jshint expr: true */
'use strict';

var _ = require('lodash');
var Promise = require('bluebird');
var expect = require('./chai-helpers').expect;
var domain = require(process.cwd() + '/server/domain');
var application = require(process.cwd() + '/server/application');
var Account = domain.Account;
var Category = domain.Category;
var Transaction = domain.Transaction;
var AccountService = application.AccountService;
var CategoryService = application.CategoryService;
var TransactionService = application.TransactionService;


// ----- Utilities -----
// Converts each element of an array to JSON
function toJSON(items) {
    _.each(items, function(item, index, list) {
        list[index] = item.toJSON();
    });
    return items;
}

// Returns transaction data for transmission
function toTransactionData(transaction, accountId, categoryId) {
    return {
        txn_date: new Date(transaction.date),
        payee: transaction.payee,
        memo: transaction.memo,
        amount: parseFloat(transaction.amount),
        account_id: accountId,
        category_id: categoryId
    };
}

var World = function World(callback) {
    // Cached objects
    this.account = undefined;
    this.accounts = undefined;

    this.category = undefined;
    this.categories = undefined;

    this.transaction = undefined;
    this.transactions = undefined;

    this.transactionsByCategory = undefined;

    // ----- Accounts -----
    this.createAccount = function(name, callback) {
        var self = this;

        AccountService.createAccount({name: name})
            .then(function(account) {
                self.account = account.toJSON();
                callback();
            });
    };

    this.createAccounts = function(accounts, callback) {
        var self = this;

        var tasks = [];
        _.each(accounts, function(account) {
            tasks.push(AccountService.createAccount({name: account.name}));
        });

        Promise.all(tasks)
            .then(function(accounts) {
                self.accounts = toJSON(accounts);
                callback();
            });
    };

    this.changeAccountName = function(name, callback) {
        var self = this;

        self.account.name = name;

        AccountService.updateAccount(self.account)
            .then(function(account) {
                self.account = account.toJSON();
                callback();
            });
    };

    this.getAccount = function(callback) {
        var self = this;

        AccountService.getAccount(self.account.id)
            .then(function(account) {
                self.account = account.toJSON();
                callback();
            });
    };

    this.deleteAccount = function(callback) {

        AccountService.deleteAccount(this.account.id)
            .then(function() {
                callback();
            });
    };

    this.assertAccountName = function(expectedName) {
        expect(this.account.name).to.equal(expectedName);
    };

    this.assertAccountDoesNotExist = function(callback) {
        AccountService.getAccount(this.account.id)
            .then(function(account) {
                callback.fail(new Error('Account exists: ' + account.get('name')));
            })
            .catch(Account.NotFoundError, function() {
                // NotFoundError is expected
                callback();
            });
    };

    // ----- Category -----
    this.createCategory = function(name, callback) {
        var self = this;

        CategoryService.createCategory({name: name})
            .then(function(category) {
                self.category = category.toJSON();
                callback();
            });
    };

    this.createCategories = function(categories, callback) {
        var self = this;

        var tasks = [];
        _.each(categories, function(category) {
            tasks.push(CategoryService.createCategory({name: category.name}));
        });

        Promise.all(tasks)
            .then(function(categories) {
                self.categories = toJSON(categories);
                callback();
            });
    };

    this.changeCategoryName = function(name, callback) {
        var self = this;

        self.category.name = name;

        CategoryService.updateCategory(self.category)
            .then(function(category) {
                self.category = category.toJSON();
                callback();
            });
    };

    this.getCategory = function(callback) {
        var self = this;

        CategoryService.getCategory(self.category.id)
            .then(function(category) {
                self.category = category.toJSON();
                callback();
            });
    };

    this.deleteCategory = function(callback) {

        CategoryService.deleteCategory(this.category.id)
            .then(function() {
                callback();
            });
    };

    this.assertCategoryName = function(expectedName) {
        expect(this.category.name).to.equal(expectedName);
    };

    this.assertCategoryDoesNotExist = function(callback) {
        CategoryService.getCategory(this.category.id)
            .then(function(category) {
                callback.fail(new Error('Category exists: ' + category.get('name')));
            })
            .catch(Category.NotFoundError, function() {
                // NotFoundError is expected
                callback();
            });
    };

    // ----- Transaction -----
    this.createTransaction = function(transaction, callback) {

        var self = this;
        var transactionData = toTransactionData(transaction, self.account.id, self.category.id);

        return TransactionService.createTransaction(transactionData)
            .then(function(transaction) {
                self.transaction = transaction.toJSON();
                callback();
            });
    };

    this.createTransactions = function(transactions, callback) {
        var self = this;

        var tasks = [];
        _.each(transactions, function(transaction) {

            var accountId = _.findWhere( self.accounts, {name: transaction.account} ).id;
            var categoryId = _.findWhere( self.categories, {name: transaction.category} ).id;
            var transactionData = toTransactionData(transaction, accountId, categoryId);

            tasks.push(TransactionService.createTransaction(transactionData));
        });

        Promise.all(tasks)
            .then(function(transactions) {
                self.transactions = toJSON(transactions);
                callback();
            });
    };

    this.changeTransactionAmount = function(amount, callback) {
        var self = this;

        self.transaction.amount = parseFloat(amount);

        TransactionService.updateTransaction(self.transaction)
            .then(function(transaction) {
                self.transaction = transaction.toJSON();
                callback();
            });
    };

    this.getTransaction = function(callback) {
        var self = this;

        TransactionService.getTransaction(self.transaction.id)
            .then(function(transaction) {
                self.transaction = transaction.toJSON();
                callback();
            });
    };

    this.getTransactionsByCategory = function(startDate, endDate, callback) {
        var self = this;

        TransactionService.getTransactionsByCategory(new Date(startDate), new Date(endDate))
            .then(function(transactionsByCategory) {
                self.transactionsByCategory = transactionsByCategory;
                callback();
            });
    };

    this.deleteTransaction = function(callback) {

        TransactionService.deleteTransaction(this.transaction.id)
            .then(function() {
                callback();
            });
    };

    this.assertTransaction = function(expectedTransaction) {
        expect(this.transaction.txn_date).to.equalDate(new Date(expectedTransaction.date));
        expect(this.transaction.payee).to.equal(expectedTransaction.payee);
        expect(this.transaction.memo).to.equal(expectedTransaction.memo);
        expect(this.transaction.amount).to.almost.equal(parseFloat(expectedTransaction.amount), 2);
        expect(this.transaction.payee).to.equal(expectedTransaction.payee);
        expect(this.transaction.account.name).to.equal(expectedTransaction.account);
        expect(this.transaction.category.name).to.equal(expectedTransaction.category);
    };

    this.assertTransactionDoesNotExist = function(callback) {
        TransactionService.getTransaction(this.transaction.id)
            .then(function(transaction) {
                callback.fail(new Error('Transaction exists: ' + transaction.id));
            })
            .catch(Transaction.NotFoundError, function() {
                // NotFoundError is expected
                callback();
            });
    };

    this.assertTransactionsByCategory = function(expectedItems) {
        var self = this;

        _.each(expectedItems, function(expectedItem) {
            var actualItem =  _.findWhere( self.transactionsByCategory, {cat_name: expectedItem.category} );
            expect(actualItem.amount).to.almost.equal(parseFloat(expectedItem.amount), 2);
        });
    };

    callback();
};

module.exports = {
    World: World
};
