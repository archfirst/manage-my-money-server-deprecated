'use strict';

var openingBalances = [
    { account_id:  1, amount:   100.00 },
    { account_id:  2, amount:  1000.00 },
    { account_id:  3, amount:  5000.00 },
    { account_id:  4, amount:  3000.00 },
    { account_id:  5, amount: -3600.00 },
    { account_id:  6, amount:  -200.00 },
    { account_id:  7, amount:  -800.00 },
    { account_id:  8, amount: 50000.00 },
    { account_id:  9, amount: 70000.00 },
    { account_id: 10, amount: 10000.00 }
];

var transactionStore = {
    openingBalances: openingBalances
}

module.exports = transactionStore;
