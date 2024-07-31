import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static saveToCache(List<dynamic> jsonList) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList(
      'cached_news',
      jsonList.map((json) => jsonEncode(json)).toList(),
    );
  }

  static Future<List<dynamic>> getJsonListFromCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final cachedJsonList = preferences.getStringList('cached_news') ?? [];
    return cachedJsonList.map((jsonString) => jsonDecode(jsonString)).toList();
  }
}
