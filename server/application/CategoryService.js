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

/**
 * Creates a new category and inserts it in to the database.
 * @param {Object} categoryData - Full category data, excluding the id. For example:
 * {
 *     name: 'Shopping'
 * }
 * @return {Promise} A promise that returns a full copy of the inserted category (including the id) on fulfillment.
 */
function createCategory(categoryData) {
    return saveCategory(categoryData);
}

/**
 * Updates an existing category.
 * @param {Object} categoryData - Full category data, including the id. For example:
 * {
 *     id: 1,
 *     name: 'Shopping'
 * }
 * @return {Promise} A promise that returns a full copy of the inserted category (including the id) on fulfillment.
 */
function updateCategory(categoryData) {
    return saveCategory(categoryData);
}

/**
 * Inserts or updates a category depending on whether the category has an `id` or not.
 * @param {Object} categoryData - Full category data, except `id` is optional.
 * @return {Promise} A promise that returns a full copy of the category on fulfillment.
 */
function saveCategory(categoryData) {
    var category = new Category(categoryData);
    return category.save();
}

/**
 * Gets an existing category.
 * @param {integer} id
 * @return {Promise} A promise that returns the desired category on fulfillment.
 */
function getCategory(id) {
    return new Category({id: id}).fetch({require: true});
}

/**
 * Gets all categories.
 * @return {Promise} A promise that returns an array of all categories on fulfillment.
 */
function getCategories() {
    return Category.fetchAll();
}

/**
 * Deletes a category.
 * @param {integer} id
 * @return {Promise} A promise that gets fulfilled when the category is deleted.
 */
function deleteCategory(id) {
    return new Category({id: id}).destroy();
}