const express = require('express');
const app = express();
const connectDB = require('./db/connect')
const userRoutes = require('./routes/router');



app.use(express.json());
require('dotenv').config(); 

//Routes
app.use('/' ,  userRoutes)


app.listen({ port: process.env.BACK_END_PORT }, async () => {
    await connectDB(process.env.MONGO_URI)
    console.log('running!!');
});