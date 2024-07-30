import 'package:news_app_manoj/src/api_service/news_api_service.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';

class NewsListRepoService {
  final NewsAPIService _newsAPIService;

  NewsListRepoService(this._newsAPIService);

  Future<List<News>> getNewsList() async {
    try {
      final data = await _newsAPIService.downloadNewsData();
      return _parseNewsList(data);
    } catch (e) {
      throw Exception('Failed to load news: ${e.toString()}');
    }
  }

  List<News> _parseNewsList(dynamic data) {
    if (data is List) {
      return data.map((item) {
        if (item is Map<String, dynamic>) {
          return News.fromJson(item);
        } else {
          throw Exception('Invalid item format in JSON response');
        }
      }).toList();
    } else {
      throw Exception(
          'Expected a list of news items but got: ${data.runtimeType}');
    }
  }
}
