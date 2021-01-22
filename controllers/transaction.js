const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');
var https = require('https');
// index page
exports.index = (req, res) => {
    if (req.session.loggedin) {
        res.render('transaction/index.ejs', {data: "", verified: req.session.loggedin});
    }
    else{
        res.render('login.ejs', {verified: req.session.loggedin});
    }
}

// login and register
exports.getjson = (req, res) => {
    if (req.session.loggedin)
    {
        var url =  'https://preview.keenthemes.com/metronic/theme/html/tools/preview/api/datatables/demos/server.php';
       
        
        https.get(url,(res) => {
            let body = "";
        
            res.on("data", (chunk) => {
                body += chunk;
            });

            res.on("end", () => {
                try {
                    
                   // let json = JSON.parse(body);
                    // do something with JSON
                } catch (error) {
                    console.error(error.message);
                };
            });
            
           return body;
        }).on("error", (error) => {
            console.error(error.message);
        });
    } else {
        res.render('login.ejs', {verified: req.session.loggedin});
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


