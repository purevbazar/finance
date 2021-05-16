const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/marketingsales')

// indexing methods
router.get('/', indexController.index);

module.exports = router