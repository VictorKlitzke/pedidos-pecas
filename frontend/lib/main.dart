import 'package:flutter/material.dart';
import 'package:ToLivre/data/core/network/dio_network.dart';
import 'package:ToLivre/data/core/routers/app_routers.dart';

void main() {
  configureDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouters,
      debugShowCheckedModeBanner: true,
      title: 'APP',
    );
  }
}