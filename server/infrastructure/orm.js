'use strict';

// -----------------------------------------------------------------------------
// Database configuration
// -----------------------------------------------------------------------------
var dbConfig = {
    client: 'postgresql',
    debug: false,
    connection: {
        host: 'localhost',
        user: '',
        password: '',
        database: 'manage-my-money',
        charset: 'utf8'
    }
};


// -----------------------------------------------------------------------------
// Postgres driver configuration
// -----------------------------------------------------------------------------
// Make sure that float column types return JavaScript floats instead of strings
var pg = require('pg');
require('pg-parse-float')(pg);


// -----------------------------------------------------------------------------
// Initialize the ORM (knex and bookshelf)
// -----------------------------------------------------------------------------
var initializeKnex = require('knex');
var initializeBookshelf = require('bookshelf');

var knex = initializeKnex(dbConfig);
var bookshelf = initializeBookshelf(knex);
bookshelf.plugin('registry');


// -----------------------------------------------------------------------------
// Destroy the database connection pool
// -----------------------------------------------------------------------------
function destroyConnectionPool(callback) {
    if (knex && knex.client) {
        knex.destroy(callback);
    }
    else {
        callback();
    }
}

// -----------------------------------------------------------------------------
// Exports
// -----------------------------------------------------------------------------
module.exports = {
    knex: knex,
    bookshelf: bookshelf,
    destroyConnectionPool: destroyConnectionPool
};