import 'package:ToLivre/data/feature/pages/list_page.dart';
import 'package:ToLivre/data/feature/pages/profile_page.dart';
import 'package:ToLivre/data/feature/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ToLivre/data/feature/layout/base_layout.dart';
import 'package:ToLivre/data/feature/pages/home_page.dart';
import 'package:ToLivre/data/feature/pages/login_page.dart';

final GoRouter appRouters = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginPage()),
    GoRoute(path: '/homepage', builder: (context, state) => BaseLayout(body: HomePage())),
    GoRoute(path: '/profile', builder: (context, state) => BaseLayout(body: ProfilePage())),
    GoRoute(path: '/search', builder: (context, state) => BaseLayout(body: SearchPage())),
    GoRoute(path: '/list', builder: (context, state) => BaseLayout(body: ListPage())),
  ],
  errorBuilder: (context, state) => Scaffold(
  body: Center(
  child: Text('Rota não encontrada: ${state.namedLocation('name')}'),
  ),
));