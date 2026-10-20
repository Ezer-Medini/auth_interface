import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Email et mot de passe corrects (écrits dans le code)
  final String emailCorrect = 'etudiant@mail.com';
  final String passwordCorrect = '1234';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void seConnecter() {
    String message;

    if (emailController.text == emailCorrect &&
        passwordController.text == passwordCorrect) {
      message = 'Connexion réussie !';
    } else {
      message = 'Email ou mot de passe incorrect';
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Connexion', style: TextStyle(fontSize: 30)),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Mot de passe'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: seConnecter,
                child: const Text('Se connecter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
