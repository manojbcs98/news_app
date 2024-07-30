import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
class NewsDetail extends StatelessWidget {

  News news;
   NewsDetail(this.news,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(news.title);
  }
}
