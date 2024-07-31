import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'package:news_app_manoj/src/network_layer/network_engine.dart';
import 'package:news_app_manoj/src/utilities/secure_storage.dart';

class NewsAPIService {
  Future<dynamic> downloadNewsData(
      {required int page, required int limit}) async {
    final networkEngine = NetworkEngine();
    final dio = networkEngine.getDio();
    final token = await SecureStorageUtil().readApiToken();
    try {
      final response = await dio.get(kNewsAppendUrlAPI, queryParameters: {
        "api_token": token,
        "language": "en",
        'page': page,
        'limit': limit
      });

      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
