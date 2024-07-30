import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'package:news_app_manoj/src/network_layer/network_engine.dart';

class NewsAPIService {
  Future<dynamic> downloadNewsData() async {
    final networkEngine = NetworkEngine();
    final dio = networkEngine.getDio();

    try {
      final response = await dio.get(kNewsAppendUrlAPI, queryParameters: {
        "api_token": "PNd88nmuTg642G7zGnSodbFIzHBuNsKBKCi4dvs4",
        "language": "en",
        'page':10,
        'limit':3
      });

      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
