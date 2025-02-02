import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;

  const BaseLayout({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color.fromARGB(255, 0, 204, 51),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), 
            color: Colors.white,
            onPressed: () {
              print('Ícone de configuração pressionado!');
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF3F7FB),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(child: body),
          // const ModernNavigationBar(),
        ],
      ),
    );
  }
}