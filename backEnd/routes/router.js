const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController')

router.get('/users' , userController.getUsers )
router.post('/signup' , userController.postUser )



module.exports = router;
