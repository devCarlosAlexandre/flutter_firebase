import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void regiterUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    credential.user?.sendEmailVerification();
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
        title: const Text("Registro de usuário"),
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
                  onPressed: regiterUser, child: Text("Cadastrar Usuário"))
            ],
          ),
        ),
      ),
    );
  }
}
