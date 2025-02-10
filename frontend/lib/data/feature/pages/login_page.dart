import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pedidos_pecas/data/core/network/auth_network.dart';
import 'package:pedidos_pecas/data/feature/widget/components/app_colors_components.dart';
import 'package:pedidos_pecas/data/feature/widget/components/buttons/padrao_button.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthNetwork authNetwork = AuthNetwork();
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  void postLogin(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        bool success = await authNetwork.postLogin(username, password);
        if (success) {
          context.go('/homepage');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Falha no login. Verifique suas credenciais.')),
          );
        }
      } catch (error) {
        print('Erro ao fazer login: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao fazer login. Tente novamente.')),
        );
      } finally {
        setState(() => isLoading = false);
      }
    }
  }

  // Future<void> loginWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //     if (googleUser != null) {
  //       context.go('/homepage');
  //     }
  //   } catch (error) {
  //     print('Erro ao fazer login com Google: $error');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Erro ao conectar com o Google.')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade300],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Card(
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.lock_outline,
                        size: 64.0,
                        color: Colors.blue.shade800,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                      SizedBox(height: 24.0),
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira seu nome';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira sua senha';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 24.0),
                      PadraoButton(
                        onPressed: isLoading ? null : () => postLogin(context),
                        text: 'Entrar',
                        textColor: Colors.white,
                        backgroundColor: AppColorsComponents.primary,
                        fontSize: 18,
                        padding: EdgeInsets.symmetric(horizontal: 37, vertical: 12),
                        textAlign: Alignment.center,
                        isLoading: isLoading,
                      ),
                      SizedBox(height: 16.0),
                      GestureDetector(
                        // onTap: loginWithGoogle,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/google_logo.png',
                                height: 24,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Entrar com Google',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
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
