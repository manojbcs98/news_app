import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:news_app_manoj/src/constants/string_constants.dart';

class SecureStorageUtil {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveApiToken(String token) async {
    await _storage.write(key: apiToken, value: token);
  }

  Future<String?> readApiToken() async {
    return await _storage.read(key: apiToken);
  }
}
