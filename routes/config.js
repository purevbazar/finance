const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/config')

// indexing methods
router.get('/', indexController.index);

router.post('/add', indexController.add);

router.get('/edit/:id', indexController.edit);

router.post('/update', indexController.update);

module.exports = router