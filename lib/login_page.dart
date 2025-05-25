import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'home_page.dart';
import 'remember_me_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  final RememberMeService _rememberMeService = RememberMeService();

  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _checkRemembered();
  }

  void _checkRemembered() async {
    bool remembered = await _rememberMeService.isRemembered();
    if (remembered && _authService.currentUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  void _login() async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      if (_rememberMe) {
        await _rememberMeService.saveRememberMe(true);
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Login with Google"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Sign in with Google"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                const Text("Remember Me")
              ],
            )
          ],
        ),
      ),
    );
  }
}
