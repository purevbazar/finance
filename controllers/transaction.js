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
                    'SELECT * FROM transaction_type',
                    (error, types) => {
                        if(accounts.length!=0 && types !=0){
                            connection.query(
                                "SELECT *,  DATE_FORMAT(transaction_date,'%Y/%m/%d') as date FROM transaction ORDER BY transaction_date DESC",
                                (error, transactions) => {
                                    if(error==null){
                                        res.render('transaction/index.ejs', {accounts: accounts, types: types, transactions: transactions, verified: req.session.loggedin});
                                    } 
                                }
                            );
                           
                        } else{
                            req.flash('error', 'Та эхлээд данс болон гүйлгээний утгуудаа бүрэн тохируулна уу!');
                            res.render('config/index.ejs', {data: accounts, typeData:types, verified: req.session.loggedin});
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

// login and register
exports.login = (req, res) => {
    if (req.session.loggedin){
        res.redirect('/');
    } else {
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.add = (req, res) => {
    if (req.session.loggedin) {
        let account = req.body.account;
        let amount = req.body.amount.replace(/,/g, "");
        let date = req.body.date;
        let type = req.body.type;
        let description= req.body.description;
        let username = req.session.username;
        let currency = req.body.currency;
        let cash = req.body.cash;
        var income;
   
        connection.query(
            "SELECT type from transaction_type where id = ?",
            [type],
            (error, income_type) => {
                if(error==null){
                    connection.query(
                        'INSERT INTO transaction(transaction_amount, transaction_date, transaction_description, transaction_type, transaction_account, transaction_username, transaction_cash, transaction_currency, transaction_status, income) VALUES(?, ?, ?, ?, ?, ?, ?, ?, "Бүртгэсэн", ?)',
                        [amount, date, description, type, account, username, cash, currency, income_type[0].type],
                        (error, results) => {
                            if(results!=null){
                                req.flash('success', 'Гүйлгээ амжилттай бүртгэгдлээ');
                                res.redirect('/transaction');
                            }
                            else{
                                console.log(error)
                                req.flash('error', 'Гүйлгээг бүртгэхэд алдаа гарлаа');
                                res.redirect('/transaction');
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

