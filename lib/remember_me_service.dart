<<<<<<< HEAD
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RememberMeService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveRememberMe(bool value) async {
    await _storage.write(key: 'remember_me', value: value.toString());
  }

  Future<void> saveEmail(String email) async {
    await _storage.write(key: 'email', value: email);
  }

  Future<bool> isRemembered() async {
    String? value = await _storage.read(key: 'remember_me');
    return value == 'true';
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: 'email');
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }
}

=======
import 'package:shared_preferences/shared_preferences.dart';

class RememberMeService {
  Future<void> saveRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('remember_me', value);
  }

  Future<bool> isRemembered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('remember_me') ?? false;
  }
}
>>>>>>> 4683582288b2d8b6b9983fd584d1049e26e105f1
