'use strict';

var bookshelf = require('../infrastructure/orm').bookshelf;

var Account = bookshelf.model('Account', {
    tableName: 'accounts',
    transactions: function() {
        return this.hasMany('Transaction');
    }
});

module.exports = Account;