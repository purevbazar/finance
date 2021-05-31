const session = require('express-session')
const connection = require('../models/db')
const truncate = require('truncate');

// index page
exports.index = (req, res) => {
    connection.query(
        'select extract(MONTH from transaction_date) as month, sum(CASE WHEN income = 1 THEN transaction_amount ELSE 0 END) as income , sum(CASE WHEN income = 0 THEN transaction_amount ELSE 0 END) as expense from transaction group by month',
        (error, transaction) => {
            if(error==null){
                res.render('index.ejs', {transaction: transaction, verified: req.session.loggedin, Truncate: truncate});
            }
            else{
                console.log(error);
            }
        }
    );
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


// admin edit blog post
exports.edit = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'SELECT * FROM posts WHERE id = ?',
            [req.params.id],
            (error, results) => {
                res.render('edit.ejs', {post: results[0], verified: req.session.loggedin});
            }
        );
    }
}

// Update method for /edit page
exports.update = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'UPDATE posts SET title = ?, content = ? WHERE id = ?',
            [req.body.title, req.body.content, req.params.id],
            (error, results) => {
                res.redirect('/');
            }
        );
    }
}

// delete
exports.delete = (req, res) => {
    if (req.session.loggedin) {
        connection.query(
            'DELETE FROM posts WHERE id = ?',
            [req.params.id],
            (error, results) => {
                res.redirect('/');
            }
        );
    } else {
        res.send('something went wrong !');
    }
}

// new blog (get)
exports.new_get = (req, res) => {
    
    if(req.session.loggedin) {
        res.render('new.ejs', {verified: req.session.loggedin});
    } else {
        res.redirect('/login');
    }
}

// new blog (post)
exports.new_post = (req, res) => {
    connection.query(
        'INSERT INTO posts(title, content, post_date) VALUES(?, ?, NOW())',
        [req.body.title, req.body.content],
        (error, results) => {
            res.redirect('/');
        }
    );
}

// viewing the post
exports.post = (req, res) => {
    connection.query(
        'SELECT * FROM posts WHERE id = ?',
        [req.params.id],
        (error, results) => {
            res.render('read.ejs', {post: results[0], verified: req.session.loggedin});
        }
    );
}