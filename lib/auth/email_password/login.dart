import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final user = credential.user;
    if (user != null && !user.emailVerified) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text("Email não confirmado, por favor verifique seu email!")));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login de usuário"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                  )),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(label: Text("Password")),
              ),
              ElevatedButton(
                  onPressed: loginUser, child: const Text("Cadastrar Usuário"))
            ],
          ),
        ),
      ),
    );
  }
}
