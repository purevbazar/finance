const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/transaction')

// indexing methods
router.get('/', indexController.index);

router.post('/add', indexController.add);

router.get('/edit/:id', indexController.edit);

router.post('/editTransaction', indexController.editTransaction);

module.exports = router