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
                            res.render('transaction/index.ejs', {accounts: accounts, types: types ,verified: req.session.loggedin});
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


