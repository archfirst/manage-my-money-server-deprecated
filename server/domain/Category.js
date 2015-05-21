'use strict';

var bookshelf = require('../infrastructure/orm').bookshelf;

var Category = bookshelf.model('Category', {
    tableName: 'categories'
});

module.exports = Category;