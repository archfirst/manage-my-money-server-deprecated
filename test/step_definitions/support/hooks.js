'use strict';

var orm = require(process.cwd() + '/server/infrastructure/orm');
var knex = orm.knex;

var myHooks = function() {

    this.Before(function(callback) {

        // Truncate assets
        knex.raw('truncate table accounts cascade')
            .then(function() {
                return knex.raw('truncate table categories cascade');
            })
            .then(function() {
                callback();
            })
            .catch(function(e) {
                console.error(e);
            });
    });

    // Stop the database after all tests are done
    this.registerHandler('AfterFeatures', function(event, callback) {
        orm.destroyConnectionPool(callback);
    });
};

module.exports = myHooks;