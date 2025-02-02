const pool = require('../services/index');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
require('dotenv').config();

exports.postLogin = async (req, res) => {
  const { username, password } = req.body;

  if (!username || !password) {
    return res.status(401).json({ message: 'Usuario ou senha invalidos' });
  }
  try {

    pool.get("SELECT * FROM usuarios WHERE nome = ?", [username], async (err, user) => {
      if (err) {
          console.error("Erro na consulta ao banco:", err.message);
          return res.status(500).json({ error: "Erro interno no servidor" });
      }

      user.senha = user.senha.replace("$2y$", "$2a$");
      const isPasswordValid = bcrypt.compare(password, user.senha);
      if (!isPasswordValid) {
          return res.status(401).json({ error: "Senha incorreta" });
      }
      const token = jwt.sign({ id: user.id }, process.env.TOKEN, { expiresIn: "3h" });

      res.cookie('token', token, {
          httpOnly: true,
          secure: false,
          sameSite: 'lax',
          maxAge: 18000000
      });

      return res.json({
          authorization: true,
          token: token,
          message: "Login realizado com sucesso",
          UserId: user.id
      });
  });

  } catch (error) {
    return res.status(500).send({ message: error.message });
  }
}