const sql = require('mysql2')
require('dotenv').config();

const pool = sql.createConnection({
  host: process.env.DB_HOST,      
  user: process.env.DB_USER,          
  password: process.env.DB_PASSWORD,  
  database: process.env.DB_DATABASE
})

pool.connect((err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err.stack);
    return;
  }
  console.log('Conectado ao banco de dados MySQL!');
});

module.exports = pool;