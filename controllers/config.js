const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');
console.log("I am here");
// index page
exports.index = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            "SELECT *, DATE_FORMAT(created_at,'%Y/%m/%d') as date FROM accounts ORDER BY id desc", 
            (error, results) => {
                res.render('config/index.ejs', {data: results, verified: req.session.loggedin});
            }
        );
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.add = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM accounts WHERE accountNumber = ?',
            [req.body.accountNumber],
            (error, results) => {
                console.log("Before editing .....")
                console.log(results.length)
                if(results.length>=1){
                    console.log("error");
                    req.flash('error', 'Энэ данс бүртгэлтэй байна!');
                    res.redirect('/config');
                }
                else{
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
                                req.flash('success', 'Данс амжилттай нэмэгдлээ');
                                res.redirect('/config');
                            }

                        );
                    }
                }
            }
        )
            
        }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

exports.update = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM accounts WHERE accountNumber = ?',
            [req.body.accountNumber],
            (error, results) => {
                console.log("Before editing .....")
                console.log(results.length)
                if(results.length>1){
                    console.log("error");
                    req.flash('error', 'Энэ данс бүртгэлтэй байна!');
                    res.redirect('/config');
                }
                else{
                    let number = req.body.accountNumber;
                    let name = req.body.accountName;
                    let currency = req.body.currency;
                    let id = req.body.id;
                    let status = "";
                    let errors = false;
                   
                    if(name.length === 0 || number.length === 0) {
                        errors = true;
                
                        // set flash message
                        req.flash('error', "Мэдээллээ бүрэн бөглөнө үү");
                        // render to add.ejs with flash message
                        res.render('config')
                    }
    
                    if(req.body.isActive == "on"){
                        status = 1;
                    }
                    else{
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
                    console.log("I am updating...");
                    connection.query(
                        'UPDATE accounts SET accountName = ?, accountNumber = ?, Currency = ?, isActive = ? WHERE id = ?',
                        [name, number, currency, status, id],
                        (error, results) => {
                            req.flash('success', 'Амжилттай засварлалаа');
                            res.redirect('/config');
                        }
    
                    );
                    
                }

                }
            }
        );
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


