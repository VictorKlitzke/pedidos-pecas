import 'package:flutter/material.dart';
import 'package:pedidos_pecas/data/core/network/api_network.dart';

class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final GetServices getServices = GetServices();
  bool isLoading = false;
  List<Map<String, dynamic>> listOrders = [];

  @override
  void initState() {
    super.initState();
    getOrders();
  }

  void getOrders() async{
    setState(() {
      isLoading = true;
    });
    try {
      final result = await getServices.getOrders();
      setState(() {
        listOrders = result;
      });
    } catch (error) {
      print('erro ao buscar funcao: $error');
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(12.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              'Pedidos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade700,
              ),
            ),
            Expanded(
              child: isLoading ? 
              const Center(child: CircularProgressIndicator()):
              listOrders.isEmpty ? 
              const Center(
                child: Text('Nenhum pedido registrado!'),
                    ) :
                    ListView.builder(
                      itemCount: listOrders.length,
                      itemBuilder: (context, index) {
                        final orders = listOrders[index];
                        return Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        margin: const EdgeInsets.all(12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            orders['status'] ?? 'Sem status',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        );
                      },
                    )
            ),
          ],
        ),
      ),
    );
  }
}