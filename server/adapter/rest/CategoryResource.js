'use strict';

module.exports = {
    addRoutes: addRoutes
};

// Add routes to the api
function addRoutes(api) {
    api.post('/categories', createCategory);
    api.put('/categories/:id', updateCategory);
    api.get('/categories', getCategories);
    api.get('/categories/:id', getCategory);
    api.delete('/categories/:id', deleteCategory);
}


var log = require('../../infrastructure/logger');
var domain = require('../../domain');
var application = require('../../application');
var Category = domain.Category;
var CategoryService = application.CategoryService;

// Creates a new category
function createCategory(req, res) {

    var categoryData = req.body;

    CategoryService.createCategory(categoryData)
        .then(function(category) {
            res.send(category);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Updates an existing category
function updateCategory(req, res) {

    var categoryData = req.body;

    CategoryService.updateCategory(categoryData)
        .then(function(category) {
            res.send(category);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Returns all categories
function getCategories(req, res) {
    CategoryService.getCategories()
        .then(function(categories) {
            res.send(categories);
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Returns the category
function getCategory(req, res) {

    var id = req.params.id;

    CategoryService.getCategory(id)
        .then(function(category) {
            res.send(category);
        })
        .catch(Category.NotFoundError, function() {
            res.status(404).send({'message': 'Category ' + id + ' does not exist'});
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}

// Deletes the specified category
function deleteCategory(req, res) {

    var id = req.params.id;

    CategoryService.deleteCategory(id)
        .then(function() {
            res.status(204).send();  // No Content
        })
        .catch(function(error) {
            log.error(error);
            res.status(500).send({'message': error.toString()});
        });
}