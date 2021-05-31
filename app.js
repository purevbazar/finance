const express = require('express');
const session = require('express-session');
const { render } = require('ejs');
const { urlencoded } = require('express');
const flash = require('express-flash');

app = express();
app.use(express.static('public'));
app.use(urlencoded({extended: false}));
app.use(flash());
// JSON SETTINGS
const sessionconfig = require('./config/session.json');
const connection = require('./models/db')


// Session
// Change the session secret key later
app.use(session({
    secret: sessionconfig.secret,
    resave: sessionconfig.resave,
    saveUninitialized: sessionconfig.saveUninitialized
}));

// Routers
let router = require('./routes/index')
let authRouter = require('./routes/auth')
let profileRouter = require('./routes/profile')
let configRouter = require('./routes/config');
let transactionRouter = require('./routes/transaction');
let msRouter = require('./routes/marketingsales');
let reportRouter = require('./routes/report');
let customerRouter = require('./routes/customers');

app.use('/', router) // index router {index, login, register pages}
app.use('/auth', authRouter) // auth router
app.use('/profile', profileRouter) // profile router
app.use('/config', configRouter)
app.use('/transaction', transactionRouter)
app.use('/marketingsales', msRouter)
app.use('/report', reportRouter)
app.use('/customers', customerRouter)


app.listen(process.env.PORT || 3000);
