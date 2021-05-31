const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');
var https = require('https');
// index page
exports.index = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM accounts WHERE isActive = 1',
            (error, accounts) => {
                connection.query(
                    'SELECT * FROM customers',
                    (error, customers) => {
                        if(error==null){
                            res.render('customers/index.ejs', {customers: customers, verified: req.session.loggedin});
                        }
                        else{
                            req.flash('error', 'Алдаа гарлаа');
                            res.render('customers/index.ejs', { verified: req.session.loggedin});
                        }
                    }
                );
            }
        );
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.add = (req, res) => {
    if (req.session.loggedin) {
        let customerCount = req.body.customerCount;
        let date = req.body.month;
        let expense = req.body.amount;
        connection.query(
            'INSERT INTO customers(customer_count, customer_date, expense) VALUES(?, ?, ?)',
            [customerCount, date, expense],
            (error, results) => {
                if(results!=null){
                    req.flash('success', 'Хэрэглэгчийн тоог амжилттай бүртгэгдлээ');
                    res.redirect('/customers');
                }
                else{
                    console.log(error)
                    req.flash('error', 'Хэрэглэгчийн тоог бүртгэхэд алдаа гарлаа');
                    res.redirect('/customers');
                }
            }
        );
                
    }  
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.edit = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM customers WHERE id = ?',
            [req.params.id],
            (error, results) => {
                res.render('customers/edit.ejs', {data: results, verified: req.session.loggedin});
            }
        );
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.updatec = (req, res) => {
    if (req.session.loggedin) {
        let id = req.body.id;
        let customerCount = req.body.customerCount;
        let date = req.body.month;
        console.log(id)
        console.log("I am here");
        connection.query(
                'UPDATE customers SET customer_count = ?, date = ? WHERE id = ?',
                [customerCount, date, id],
                (error, results) => {
                    if(error==null){
                        console.log(results)
                        req.flash('success', 'Амжилттай засварлалаа');
                        res.redirect('/customers');
                    }
                    else{
                        req.flash('error', 'Засварлахад алдаа гарлаа');
                        res.redirect('/customers');
                    }
                }
            );
        }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}