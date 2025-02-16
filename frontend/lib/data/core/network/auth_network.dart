import 'package:ToLivre/data/core/network/dio_network.dart';

class AuthNetwork {
  Future<bool> postLogin(String username, String password) async {
    try {
      final response = await dio.post('postLogin', data: {
        'username': username,
        'password': password
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print('Erro ao tentar conectar ao login $error');
      return false;
    }
  }
  }