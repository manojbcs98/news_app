import 'dart:convert';

import 'package:news_app_manoj/src/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static saveToCache(List<dynamic> jsonList) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setStringList(
      cachedNewsText,
      jsonList.map((json) => jsonEncode(json)).toList(),
    );
  }

  static Future<List<dynamic>> getJsonListFromCache() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final cachedJsonList = preferences.getStringList(cachedNewsText) ?? [];
    return cachedJsonList.map((jsonString) => jsonDecode(jsonString)).toList();
  }
}
