const mysql = require('mysql');

var db  = mysql.createPool({
    connectionLimit : 10,
    host: 'us-cdbr-east-03.cleardb.com',
    user: 'bfd3f2b02b2a7d',
    password: 'fa5387ad',
    database: 'heroku_83f7e24467de818'
  });
  
module.exports = db;