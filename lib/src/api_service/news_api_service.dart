import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'package:news_app_manoj/src/network_layer/network_engine.dart';

class NewsAPIService {
  Future<dynamic> downloadNewsData(
      {required int page, required int limit}) async {
    final networkEngine = NetworkEngine();
    final dio = networkEngine.getDio();

    try {
      final response = await dio.get(kNewsAppendUrlAPI, queryParameters: {
        "api_token": "sX7n1YhXZUARPioJaEJwvXbgFJ0O43Cfd91mHuaW",
        "language": "en",
        'page': 1,
        'limit': 3
      });

      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
