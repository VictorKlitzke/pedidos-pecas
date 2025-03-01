import 'package:flutter/material.dart';
import 'package:ToLivre/data/feature/widget/components/list_services_components.dart';

class HomePage extends StatefulWidget{
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
        body: ListServicesComponents(),
    );
  }
}