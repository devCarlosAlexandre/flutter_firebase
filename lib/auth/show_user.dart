import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatefulWidget {
  const ShowUser({Key? key}) : super(key: key);

  @override
  State<ShowUser> createState() => _ShowUserState();
}

class _ShowUserState extends State<ShowUser> {
  User? user;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.maxFinite),
          Text("Nome: ${user?.displayName ?? ''}"),
          Text("email: ${user?.email ?? ''}"),
          Text(user?.photoURL ?? ''),
          TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text("Sair"))
        ],
      ),
    );
  }
}
