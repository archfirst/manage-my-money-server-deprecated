'use strict';

module.exports = {
    createCategory: createCategory,
    updateCategory: updateCategory,
    getCategory: getCategory,
    getCategories: getCategories,
    deleteCategory: deleteCategory
};

var domain = require('../domain');
var Category = domain.Category;

// Creates a new category and inserts it in the database.
// categoryData example:
// {
//     name: 'Shopping'
// }
// Returns a promise which when fulfilled provides the inserted category with its id populated.
function createCategory(categoryData) {
    return saveCategory(categoryData);
}

// Updates an existing category. Full category data must be provided, including the id
// Returns a promise which when fulfilled provides the updated category.
// categoryData example:
// {
//     id: 1
//     name: 'Shopping'
// }
function updateCategory(categoryData) {
    return saveCategory(categoryData);
}

function saveCategory(categoryData) {
    var category = new Category(categoryData);
    return category.save();
}

// Gets an existing category
// Returns a promise which when fulfilled provides the category.
function getCategory(id) {
    return new Category({id: id}).fetch({require: true});
}

// Gets all categories
// Returns a promise which when fulfilled provides an array of categories.
function getCategories() {
    return Category.fetchAll();
}

// Deletes an existing category
// Returns a promise which when fulfilled deletes the category.
function deleteCategory(id) {
    return new Category({id: id}).destroy();
}