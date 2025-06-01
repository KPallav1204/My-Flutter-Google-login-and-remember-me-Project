import 'package:flutter/material.dart';
import 'auth_service.dart';
<<<<<<< HEAD
import 'remember_me_service.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) async {
    await AuthService().signOut();
    await RememberMeService().clear();
=======
import 'login_page.dart';
import 'remember_me_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _logout() async {
    await AuthService().signOut();
    await RememberMeService().saveRememberMe(false);

    // Check if still in widget tree before using context
    if (!mounted) return;

>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
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
=======
        title: const Text("Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: const Center(child: Text("Welcome!")),
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
    );
  }
}

<<<<<<< HEAD

=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
