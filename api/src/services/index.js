const sql = require('sqlite3').verbose();

const Path = './app.db';

const pool = new sql.Database(Path, (err) => {
  if (err) {
    console.error('Erro ao conectar ao banco de dados:', err.message);
  } else {
    console.log('Conectado ao banco de dados SQLite.');
  }
});

module.exports = pool;