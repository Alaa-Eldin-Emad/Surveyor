const mongoose = require('mongoose')
const userSchema=  new mongoose.Schema({
    email:{
        type:String,
        required: [true , 'User email must be provided'],
        unique: true
    },
    password:{
        type:String,
        required: [true , 'User must have password']
    },
    name:{
        type:String,
        required: [true , 'User must have a name']

    },
    phoneNumber:{
        type:String,
        required: [true , 'User must have a phone number']
    }

})
module.exports = mongoose.model('User' , userSchema)