const pool = require('../services/index');
require('dotenv').config();

exports.getProducts = async (req, res) => {
  try {
    pool.all('SELECT * FROM produtos', (err, rows) => {
      if (err) {
        return res.status(500).json({ message: 'Erro ao consultar clientes', error: err.message });
      }

      return res.status(200).json({ authorization: true, getProducts: rows });
    });
  } catch (error) {

  }
}

exports.getPedidos = async (req, res) => {
  const userId = req.user.id;
  try {
    pool.all('SELECT * FROM usuarios WHERE id = ?', [userId], (err, rows) => {
      if (err) {
        return res.status(500).json({ message: 'Erro ao consultar clientes', error: err.message });
      }

      return res.status(200).json({ authorization: true, getPedidos: rows });
    });
  } catch (error) {
    return res.status(500).json({ error: error });
  }
}

exports.getLogin = async (req, res) => {
  const userId = req.user.id;
  try {
    pool.all('SELECT * FROM usuarios WHERE id = ?', [userId], (err, rows) => {
      if (err) {
        return res.status(500).json({ message: 'Erro ao consultar clientes', error: err.message });
      }

      return res.status(200).json({ authorization: true, getLogin: rows });
    });
  } catch (error) {
    return res.status(500).json({ error: error });
  }
}