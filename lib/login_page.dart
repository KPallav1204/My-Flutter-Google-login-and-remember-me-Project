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
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _checkRemembered();
  }

  void _checkRemembered() async {
    bool remembered = await _rememberMeService.isRemembered();
    String? email = await _rememberMeService.getEmail();
    await _authService.reloadUser();

    if (remembered && email != null && _authService.currentUser != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  void _login() async {
    setState(() => _loading = true);
    final user = await _authService.signInWithGoogle();
    setState(() => _loading = false);

    if (user != null) {
      if (_rememberMe) {
        await _rememberMeService.saveRememberMe(true);
        await _rememberMeService.saveEmail(user.email ?? '');
      } else {
        await _rememberMeService.clear();
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google sign-in failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : Column(
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
