import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveApiToken(String token) async {
    await _storage.write(key: 'api_token', value: token);
  }

  Future<String?> readApiToken() async {
    return await _storage.read(key: 'api_token');
  }
}
