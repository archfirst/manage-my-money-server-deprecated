'use strict';

var bookshelf = require('../infrastructure/orm').bookshelf;

var Transaction = bookshelf.model('Transaction', {
    tableName: 'transactions',
    account: function() {
        return this.belongsTo('Account');
    },
    category: function() {
        return this.belongsTo('Category');
    }
});

module.exports = Transaction;