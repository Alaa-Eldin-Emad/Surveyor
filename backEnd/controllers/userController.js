const User = require('../model/user')
const bcrypt = require('bcrypt');
const { BCRYPT_PASSWORD, SALT_ROUNDS } = process.env;


exports.getUsers = async (req , res)=>{
    const users = await User.find()
    res.status(200).json(users)
}

exports.postUser = async (req,res) =>{

    try {
        console.log(req.body)
        const userData = {
            email : req.body.email,
            password : req.body.password,
            name : req.body.name,
            phoneNumber : req.body.phoneNumber
        }
        userData.password = bcrypt.hashSync(
            userData.password + BCRYPT_PASSWORD,
            parseInt(SALT_ROUNDS)
          );
        const user = await User.create(userData)
        res.status(201).json(user)
       
    }
    catch(err){
        console.log(err)
        return res.status(500).json(err)

    }

}
