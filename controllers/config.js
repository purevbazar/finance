const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');

// index page
exports.index = (req, res) => {
    if (req.session.loggedin) {

        connection.query(
            "SELECT *, DATE_FORMAT(created_at,'%Y/%m/%d') as date FROM accounts ORDER BY id desc", 
            (error, accounts) => {
                connection.query(
                    "SELECT *, DATE_FORMAT(created_at,'%Y/%m/%d') as date FROM transaction_type ORDER BY id desc", 
                    (error, typeData) => {
                        console.log(typeData)
                        res.render('config/index.ejs', {data: accounts, typeData:typeData, verified: req.session.loggedin});
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
                    let bank = req.body.bank;
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
                            'INSERT INTO accounts(accountNumber, accountName, currency, isActive, bank) VALUES(?, ?, ?, ?, ?)',
                            [req.body.accountNumber, req.body.accountName, req.body.currency, 1, req.body.bank],
                            (error, results) => {
                                console.log(error);
                                if(results!=null){
                                    req.flash('success', 'Данс амжилттай нэмэгдлээ');
                                    res.redirect('/config');
                                }
                                else{
                                    req.flash('error', 'Бүртгэхэд алдаа гарлаа');
                                    res.redirect('/config');
                                }
                               
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

exports.addType = (req, res) => {
    console.log("Addtype");
    if (req.session.loggedin) {
        var typeConstat = req.body.constant;
        var type = req.body.type;
        var description = req.body.description;
        if(typeConstat==null){
            typeConstat = 0;
        }
        else{
            typeConstat = 1
        }
        if(type == null){
            type = 0;
        }
        else{
            type = 1
        }
        if(description == null){
            description = 0;
        }
        else{
            description = 1
        }
        connection.query(
            'SELECT * FROM transaction_type WHERE name = ? and constant = ? and type = ? ',
            [req.body.name, typeConstat, type],
            (error, results) => {
                console.log("Before editing .....")
                console.log(results.length)
                console.log(error)
                if(results.length>=1){
                    console.log("error");
                    req.flash('errorType', 'Энэ төрөл байна!');
                    res.redirect('/config');
                }
                else{
                    let description = req.body.description;
                    let name = req.body.name;
                    let errors = false;
                    console.log("I am in insert")
                    if(name.length === 0) {
                        errors = true;
                
                        // set flash message
                        req.flash('error', "Мэдээллээ бүрэн бөглөнө үү");
                        // render to add.ejs with flash message
                        res.render('config')
                    }

                        // if no error
                    if(!errors) {
                        connection.query(
                            'INSERT INTO transaction_type(name, description, constant, type) VALUES(?, ?, ?, ?)',
                            [name, description, typeConstat , type],
                            (error, results) => {
                                console.log(error);
                                req.flash('success', 'Гүйлгээний төрөл амжилттай нэмэгдлээ');
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

exports.updateType = (req, res) => {
    if (req.session.loggedin) {
        let name = req.body.name;
        let description = req.body.description;
        let id = req.body.id;
        let type = "";
        let constant = "";
        let errors = false;
       
        if(name.length === 0) {
            errors = true;
            // set flash message
            req.flash('error', "Мэдээллээ бүрэн бөглөнө үү");
            // render to add.ejs with flash message
            res.render('config')
        }

        if(req.body.type == "on"){
            type = 1;
        }
        else{
            type = 0;
        }
        
        if(req.body.constant == "on"){
            constant = 1;
        }
        else{
            constant = 0;
        }

        // if no error
        if(!errors) {
            connection.query(
                'UPDATE transaction_type SET name = ?, description = ?, type = ?, constant = ? WHERE id = ?',
                [name, description, type, constant, id],
                (error, results) => {
                    req.flash('success', 'Амжилттай засварлалаа');
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

// admin edit blog post
exports.editType = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM transaction_type WHERE id = ?',
            [req.params.id],
            (error, results) => {
                res.render('config/editType.ejs', {data: results, verified: req.session.loggedin});
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


