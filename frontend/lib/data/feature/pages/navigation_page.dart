import 'package:ToLivre/data/feature/pages/add_services.dart';
import 'package:ToLivre/data/feature/widget/components/app_colors_components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorsComponents.primary,
      child: SafeArea(
        child: BottomAppBar(
          notchMargin: 8.0,
          color: Colors.transparent,
          elevation: 1,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: AppColorsComponents.secondaryLight,
                    ),
                    onPressed: () {
                      context.go('/homepage');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: AppColorsComponents.secondaryLight,
                    ),
                    onPressed: () {
                      context.go('/search');
                    },
                  ),
                  SizedBox(width: 40),
                  IconButton(
                    icon: Icon(
                      Icons.list,
                      color: AppColorsComponents.secondaryLight,
                    ),
                    onPressed: () {
                      context.go('/list');
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.account_circle,
                      color: AppColorsComponents.secondaryLight,
                    ),
                    onPressed: () {
                      context.go('/profile');
                    },
                  ),
                ],
              ),
              Positioned(
                top: -25,
                child: FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return AddServices();
                    },
                    );
                  },
                  child: Icon(Icons.add, color: AppColorsComponents.background,),
                  backgroundColor: AppColorsComponents.primaryDark,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}