var mysql = require('mysql');
var pool = mysql.createPool({
    connectionLimit: 10,
    host: 'classmysql.engr.oregonstate.edu',
    user: 'cs340_lantiguc',
    password: '4079',
    database: 'cs340_lantiguc'
});
module.exports.pool = pool;