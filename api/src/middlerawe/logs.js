const pool = require('../services/index');

exports.logs = async (userId, type, message, date) => {

  try {

    await pool.beginTransaction();

    const query = `INSERT INTO logs (userId, type, message, date) VALUES(?, ?, ?, ?)`;

    const [result] = await pool.execute(query, [userId, type, message, date]);
    if (!result || result.length === 0) {
      console.error;
    }

    await pool.commit();

  } catch (error) {
    console.log('Erro ao tentar criar log');
  }

}