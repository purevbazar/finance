const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');
console.log("I am here");
// index page
exports.index = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM accounts ORDER BY id desc',
            (error, results) => {
                res.render('config/index.ejs', {data: results, verified: req.session.loggedin});
                console.log(results)
            }
        );
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.add = (req, res) => {
    if (req.session.loggedin) {
                let number = req.body.accountNumber;
                let name = req.body.accountName;
                let currency = req.body.currency;
                let errors = false;
                console.log("I am in insert")
                if(name.length === 0 || number.length === 0) {
                    errors = true;
            
                    // set flash message
                    req.flash('error', "Мэдээллээ бүрэн бөглөнө үү");
                    // render to add.ejs with flash message
                    res.render('config')
                }

                // if no error
            if(!errors) {
            
                var data = {
                    accountName: name,
                    accountNumber: number,
                    currency: currency,
                    isActive : 1
                }
                // insert query

                connection.query(
                    'INSERT INTO accounts(accountNumber, accountName, currency, isActive) VALUES(?, ?, ?, ?)',
                    [req.body.accountNumber, req.body.accountName, req.body.currency, 1],
                    (error, results) => {
                        console.log(error);
                        req.flash('success', 'Book successfully added');
                        res.redirect('/config');
                    }

                );
                
            }
        }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.update = (req, res) => {
    if (req.session.loggedin) {
                let number = req.body.accountNumber;
                let name = req.body.accountName;
                let currency = req.body.currency;
                let id = req.body.id;
                let status = 1;
                let errors = false;
                console.log(req.body)
                if(name.length === 0 || number.length === 0) {
                    errors = true;
            
                    // set flash message
                    req.flash('error', "Мэдээллээ бүрэн бөглөнө үү");
                    // render to add.ejs with flash message
                    res.render('config')
                }

                if(req.body.switch == null || req.body.switch == undefined){
                    status = 0;
                }

                // if no error
            if(!errors) {
            
                var data = {
                    accountName: name,
                    accountNumber: number,
                    currency: currency,
                    isActive : status
                }
                // insert query

                connection.query(
                    'UPDATE accounts SET accountName = ?, accountNumber = ?, Currency = ?, isActive = ? WHERE id = ?',
                    [name, number, currency, status, id],
                    (error, results) => {
                        console.log(error);
                        console.log(results)
                        req.flash('success', 'Book successfully added');
                        res.redirect('/config');
                    }

                );
                
            }
        }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

// admin edit blog post
exports.edit = (req, res) => {
    console.log("i am in edit")
    if (req.session.loggedin) {
       
        connection.query(
            'SELECT * FROM accounts WHERE id = ?',
            [req.params.id],
            (error, results) => {
                console.log(error)
                console.log(results)
                res.render('config/edit.ejs', {data: results, verified: req.session.loggedin});
            }
        );
    }
}



// login and register
exports.login = (req, res) => {
    if (req.session.loggedin)
    {
        res.redirect('/');
    } else {
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}


