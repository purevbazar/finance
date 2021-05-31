const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');
var https = require('https');
// index page
exports.index = (req, res) => {
    if (req.session.loggedin) {
        let transactions;
        let customers;
        res.render('report/index.ejs', {transactions: transactions, customers: customers, verified: req.session.loggedin});
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.refresh = (req, res) => {
    if (req.session.loggedin) {
        let date = req.body.date;
        let month = date.substring(5, 7);
        let year = date.substring(0, 4);
        connection.query(
            "select sum(CASE WHEN income = 1 AND transaction_type = 3 THEN transaction_amount ELSE 0 END) as income , sum(CASE WHEN income = 0 THEN transaction_amount ELSE 0 END) as expense from transaction WHERE  MONTH(transaction_date) = ? and YEAR(transaction_date) = ?",
            [month, year],
            (error, transactions) => {
                if(error==null){
                    connection.query(
                        "SELECT * FROM customers where customer_date= ?",
                        [date],
                        (error, customers) => {
                            if(error==null){
                                console.log(customers)
                                res.render('report/index.ejs', {transactions: transactions, customers: customers, verified: req.session.loggedin});
                            } 
                        }
                    );
                } 
            }
        );
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}