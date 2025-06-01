import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<bool> isUserLoggedIn() async {
    String? email = await _secureStorage.read(key: 'email');
    return email != null && email.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Login & Remember Me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}

