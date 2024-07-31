import 'dart:convert';

import 'package:news_app_manoj/src/api_service/news_api_service.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'package:news_app_manoj/src/utilities/shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsListRepoService {
  Future<List<News>> getNewsList(
      {required int page, required int limit}) async {
    Map<String, dynamic> data = {};
    List<News> news = [];
    try {
      data =
      await NewsAPIService().downloadNewsData(page: page, limit: limit);

      news = await newsListFromJson(data['data'], true);
      return news;
    } catch (e) {
      var storedResult = await SharedPrefUtil.getJsonListFromCache();
      news = await newsListFromJson(storedResult, false);
      return news;
    }
  }

  Future<List<News>> newsListFromJson(
      List<dynamic> jsonList, bool toSaveIntoCache) async {
    if (jsonList.isEmpty) {
      return [];
    }
    if (toSaveIntoCache) {
      await SharedPrefUtil.saveToCache(jsonList);
    }
    return jsonList.map<News>((item) {
      return News.fromMap(item as Map<String, dynamic>);
    }).toList();
  }
}
