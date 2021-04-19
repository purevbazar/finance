const express = require('express')
const router = express.Router();

// the indexController
const indexController = require('../controllers/config')

// indexing methods
router.get('/', indexController.index);

router.post('/add', indexController.add);

router.post('/addType', indexController.addType);

router.get('/edit/:id', indexController.edit);

router.get('/editType/:id', indexController.editType);

router.post('/update', indexController.update);

router.post('/updateType', indexController.updateType);

module.exports = router