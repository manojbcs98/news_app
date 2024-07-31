import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'package:news_app_manoj/src/widgets/cached_image.dart';
import 'news_detail_view.dart';

import 'package:shimmer/shimmer.dart';

class NewsGridWidget extends StatefulWidget {
  final List<News> newsList;

  const NewsGridWidget({Key? key, required this.newsList}) : super(key: key);

  @override
  _NewsGridWidgetState createState() => _NewsGridWidgetState();
}

class _NewsGridWidgetState extends State<NewsGridWidget> {
  ScrollController scrollController = ScrollController();
  Set<int> bookmarkedIndices = Set<int>(); // To store bookmarked item indices

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.95, // Adjust aspect ratio as needed
      ),
      itemCount: widget.newsList.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.newsList.length) {
          final news = widget.newsList[index];
          bool isBookmarked = bookmarkedIndices.contains(index);

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
                    child: newsCachedImageWidget(news.imageUrl),
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
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Text(
                        news.title,
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
                  Positioned(
                    top: 1,
                    right: 1,
                    child: IconButton(
                      icon: Icon(
                        isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Toggle bookmark logic
                        setState(() {
                          if (isBookmarked) {
                            bookmarkedIndices.remove(index);
                          } else {
                            bookmarkedIndices.add(index);
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Loading Indicator
          return _buildShimmerEffect();
        }
      },
    );
  }

  Widget _buildShimmerEffect() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
