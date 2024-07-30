import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'package:news_app_manoj/src/network_layer/network_engine.dart';

class NewsAPIService {
  Future<dynamic> downloadNewsData() async {
    final networkEngine = NetworkEngine();
    final dio = networkEngine.getDio();

    try {
      final response = await dio.get(kNewsAppendUrlAPI,
          queryParameters: {"page": 0, "size": 100});

      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
