const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/transaction')

// indexing methods
router.get('/', indexController.index);

router.get('/getjson', indexController.getjson);

module.exports = router