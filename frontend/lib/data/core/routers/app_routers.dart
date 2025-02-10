import 'package:go_router/go_router.dart';
import 'package:pedidos_pecas/data/feature/layout/base_layout.dart';
import 'package:pedidos_pecas/data/feature/pages/home_page.dart';
import 'package:pedidos_pecas/data/feature/pages/login_page.dart';

final GoRouter appRouters = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => LoginPage()),
    GoRoute(path: '/homepage', builder: (context, state) => BaseLayout(body: HomePage())),
  ]
);