const express = require('express');
const post = require('../controllers/post');

const router = express.Router();

router.post('/postLogin', post.postLogin);

module.exports = router;