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
<<<<<<< HEAD
  bool _loading = false;
=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1

  @override
  void initState() {
    super.initState();
    _checkRemembered();
  }

  void _checkRemembered() async {
    bool remembered = await _rememberMeService.isRemembered();
<<<<<<< HEAD
    String? email = await _rememberMeService.getEmail();
    await _authService.reloadUser();

    if (remembered && email != null && _authService.currentUser != null) {
=======
    if (remembered && _authService.currentUser != null) {
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    }
  }

  void _login() async {
<<<<<<< HEAD
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

=======
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      if (_rememberMe) {
        await _rememberMeService.saveRememberMe(true);
      }
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
<<<<<<< HEAD
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Google sign-in failed")),
      );
=======
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
<<<<<<< HEAD
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
=======
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
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
      ),
    );
  }
}
