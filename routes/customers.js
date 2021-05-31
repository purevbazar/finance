const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/customers')

// indexing methods
router.get('/', indexController.index);

router.post('/add', indexController.add);

router.get('/edit/:id', indexController.edit);

router.post('/updatec', indexController.updatec);

module.exports = router