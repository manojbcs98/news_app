import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/widgets/cached_image.dart';
import 'news_detail_view.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_states.dart';

Widget newsGrid(NewsLoaded state, ScrollController scrollController){
  return GridView.builder(
    physics: BouncingScrollPhysics(),
    controller: scrollController,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 0.95, // Adjust aspect ratio as needed
    ),
    itemCount: state.newsList.length,
    itemBuilder: (context, index) {
      final news = state.newsList[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsDetail(news)),
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              Positioned.fill(
                child: newsCachedImageWidget(news.imageUrl)
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    ),
                  ),
                  child: Text(
                    news.title, // Display title or other relevant information
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}