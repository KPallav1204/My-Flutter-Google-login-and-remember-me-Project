import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Create an instance of secure storage
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Check if user is already logged in
  Future<bool> isUserLoggedIn() async {
    String? email = await _secureStorage.read(key: 'email');
    return email != null;
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
              body: Center(
                child: CircularProgressIndicator(), // Show loading
              ),
            );
          } else if (snapshot.hasData && snapshot.data == true) {
            return const HomePage(); // Logged in ✅
          } else {
            return const LoginPage(); // Not logged in ❌
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

