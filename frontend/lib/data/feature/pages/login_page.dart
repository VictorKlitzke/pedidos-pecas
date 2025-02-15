import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pedidos_pecas/data/core/network/auth_network.dart';
import 'package:pedidos_pecas/data/core/network/google_api_network.dart';
import 'package:pedidos_pecas/data/feature/widget/components/app_colors_components.dart';
import 'package:pedidos_pecas/data/feature/widget/components/buttons/padrao_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthNetwork authNetwork = AuthNetwork();
  final GoogleAuthService googleAuthService = GoogleAuthService();
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void postGoogle(BuildContext context) async {
    final account = await googleAuthService.signInWithGoogle();
    if (account != null) {
      print('Logado como: ${account.displayName}');
      print('Email: ${account.email}');
      print('Foto: ${account.photoUrl}');
      context.go('/homepage');
    }
  }

  void postLogin(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username != null || password != null) {

    }

    try {
      bool success = await authNetwork.postLogin(username, password);
      if (success) {
        context.go('/homepage');
      }
    } catch (error) {
      print('Erro ao fazer login $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade900, Colors.blue.shade400],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 70.0,
                        color: Colors.blue.shade800,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Bem-vindo!',
                        style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Usuário',
                          prefixIcon:
                              Icon(Icons.person, color: Colors.blue.shade700),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Digite seu usuário'
                            : null,
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon:
                              Icon(Icons.lock, color: Colors.blue.shade700),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        validator: (value) => value == null || value.isEmpty
                            ? 'Digite sua senha'
                            : null,
                      ),
                      SizedBox(height: 24.0),
                      PadraoButton(
                        onPressed: isLoading ? null : () => postLogin(context),
                        text: 'Entrar',
                        textColor: Colors.black,
                        backgroundColor: AppColorsComponents.third,
                        fontSize: 18,
                        padding:
                            EdgeInsets.symmetric(horizontal: 115, vertical: 18),
                        textAlign: Alignment.center,
                        isLoading: isLoading,
                      ),
                      SizedBox(height: 16.0),
                      Divider(thickness: 1.2, color: Colors.grey.shade400),
                      SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        label: Text(''),
                        onPressed: () => postGoogle(context),
                        icon: FaIcon(FontAwesomeIcons.google,
                            color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red.shade700,
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 24),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
