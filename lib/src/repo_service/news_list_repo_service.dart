import 'package:news_app_manoj/src/api_service/news_api_service.dart';
import 'package:news_app_manoj/src/constants/string_constants.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'package:news_app_manoj/src/utilities/list_from_json.dart';
import 'package:news_app_manoj/src/utilities/shared_preference.dart';

class NewsListRepoService {
  Future<List<News>> getNewsList(
      {required int page, required int limit}) async {
    Map<String, dynamic> data = {};
    List<News> news = [];
    try {
      data =
      await NewsAPIService().downloadNewsData(page: page, limit: limit);

      news = await ListFromJsonUtil.newsListFromJson(data[dataText], true);
      return news;
    } catch (e) {
      var storedResult = await SharedPrefUtil.getJsonListFromCache();
      news = await ListFromJsonUtil.newsListFromJson(storedResult, false);
      return news;
    }
  }

}
