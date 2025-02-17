import 'package:ToLivre/data/feature/widget/components/app_colors_components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Página $_currentIndex'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColorsComponents.primary,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          switch (index) {
            case 0:
              context.go('/homepage');
              break;
            case 1:
              context.go('/add');
              break;
            case 2:
              context.go('/search');
              break;
            case 3:
              context.go('/profile');
              break;
          }
        },
      ),
    );
  }
}
