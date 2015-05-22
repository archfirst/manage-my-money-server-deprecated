/**
 * api.js
 * Returns the api that will be used to create the HTTP server
 */
'use strict';

var express = require('express');
var api = express();
var bodyParser = require('body-parser');

// Middleware to enable CORS
var enableCORS = function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With');

    // intercept OPTIONS method to simply send a 200 response
    if (req.method === 'OPTIONS') {
        res.status(200).end();
    }
    else {
        next();
    }
};

// Add middleware to enable CORS
api.use(enableCORS);

// Add middleware to parse the POST data of the body
api.use(bodyParser.urlencoded({extended: true}));

// Add middleware to parse application/json
api.use(bodyParser.json());

// Serve static content from the public directory
api.use('/', express.static(__dirname + '/../public'));

// Add API routes
require('./AccountResource').addRoutes(api);
require('./CategoryResource').addRoutes(api);
require('./TransactionResource').addRoutes(api);

module.exports = api;