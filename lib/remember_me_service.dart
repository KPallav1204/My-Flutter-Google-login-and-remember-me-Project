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

