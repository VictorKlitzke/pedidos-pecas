const express = require('express');
const post = require('../controllers/post');
const get = require('../controllers/get');
const auth = require('../middlerawe/auth');

const router = express.Router();

router.post('/postLogin', post.postLogin);

router.get('/getProducts', auth, get.getProducts);
router.get('/getLogin', auth, get.getLogin);

module.exports = router;