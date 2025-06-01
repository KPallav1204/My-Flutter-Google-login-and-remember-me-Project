import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'remember_me_service.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) async {
    await AuthService().signOut();
    await RememberMeService().clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome! You are logged in."),
      ),
    );
  }
}


