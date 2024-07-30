import 'package:news_app_manoj/src/api_service/news_api_service.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';

class NewsListRepoService {
  Future<List<News>> getNewsList({required int page, required int limit}) async {
    try {
      Map<String, dynamic> data = await NewsAPIService().downloadNewsData(page: page,limit: limit);
      return newsListFromJson(data['data']);
    } catch (e) {
      throw Exception('Failed to load news: ${e.toString()}');
    }
  }

  List<News> newsListFromJson(List<dynamic> jsonList) {
    if (jsonList.isEmpty) {
      return [];
    }

    return jsonList.map<News>((item) {
      return News.fromMap(item as Map<String, dynamic>);
    }).toList();
  }
}
