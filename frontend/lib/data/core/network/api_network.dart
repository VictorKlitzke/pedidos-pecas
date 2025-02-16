import 'package:ToLivre/data/core/network/dio_network.dart';

class GetServices {
  Future<List<Map<String, dynamic>>> getOrders() async {
    try {
      final response = await dio.get('getPedidos');
      if (response.data != null || response.data['getPedidos']) {
        return List<Map<String, dynamic>>.from(response.data['getuser']);
      } else {
        return [];
      }

    } catch (error) {
      print('erro ao consultar a api: $error');
      return [];
    }
  }
}