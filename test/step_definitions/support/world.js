/* jshint expr: true */
'use strict';

var expect = require('./chai-helpers').expect;

var World = function World(callback) {

    this.account = undefined;
    this.category = undefined;
    this.transaction = undefined;

    var domain = require(process.cwd() + '/server/domain');
    var application = require(process.cwd() + '/server/application');
    var Account = domain.Account;
    var Category = domain.Category;
    var Transaction = domain.Transaction;
    var AccountService = application.AccountService;
    var CategoryService = application.CategoryService;
    var TransactionService = application.TransactionService;

    // ----- Accounts -----
    this.createAccount = function(name, callback) {
        var self = this;

        AccountService.createAccount({name: name})
            .then(function(account) {
                self.account = account.toJSON();
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

        AccountService.createAccount({name: transaction.account})
            .then(function(account) {
                self.account = account.toJSON();
                return CategoryService.createCategory({name: transaction.category});
            })
            .then(function(category) {
                self.category = category.toJSON();
                var transactionData = {
                    txn_date: new Date(transaction.date),
                    payee: transaction.payee,
                    memo: transaction.memo,
                    amount: parseFloat(transaction.amount),
                    account_id: self.account.id,
                    category_id: self.category.id
                };
                return TransactionService.createTransaction(transactionData);
            })
            .then(function(transaction) {
                self.transaction = transaction.toJSON();
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

    callback();
};

module.exports = {
    World: World
};
