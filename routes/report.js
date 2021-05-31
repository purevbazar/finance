const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/report')

// indexing methods
router.get('/', indexController.index);

router.post('/refresh', indexController.refresh);

module.exports = router