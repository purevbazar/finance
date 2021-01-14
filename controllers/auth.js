const session = require('express-session')
const connection = require('../models/db')

exports.login = (req, res) => {

    var username = req.body.username;
    var password = req.body.password;
    connection.query(
        'SELECT * FROM accounts_express WHERE username = ? AND password = ?',
        [username, password],
        (error, results) => {
            if (results.length > 0) {
                req.session.loggedin = true;
				req.session.username = username;
				res.redirect('/');
            } else {
                req.flash('error', "Нэвтрэх нэр нууц үг буруу байна");
                res.redirect('/login');
            }
        }
    );
}

exports.logout = (req, res) => {
    req.session.loggedin = false;
    req.session.username = null;
    res.redirect('/login');
}