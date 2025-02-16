import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ToLivre/data/feature/layout/base_layout.dart';
import 'package:ToLivre/data/feature/pages/home_page.dart';
import 'package:ToLivre/data/feature/pages/login_page.dart';

final GoRouter appRouters = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginPage()),
    GoRoute(path: '/homepage', builder: (context, state) => BaseLayout(body: HomePage())),
  ],
  errorBuilder: (context, state) => Scaffold(
  body: Center(
  child: Text('Rota não encontrada: ${state.namedLocation('name')}'),
  ),
));