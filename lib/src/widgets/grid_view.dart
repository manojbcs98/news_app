import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'package:news_app_manoj/src/widgets/cached_image.dart';
import 'package:news_app_manoj/src/widgets/shimmer.dart';
import 'news_detail_view.dart';

class NewsGridWidget extends StatefulWidget {
  final List<News> newsList;

  const NewsGridWidget({Key? key, required this.newsList}) : super(key: key);

  @override
  _NewsGridWidgetState createState() => _NewsGridWidgetState();
}

class _NewsGridWidgetState extends State<NewsGridWidget> {
  ScrollController scrollController = ScrollController();
  Set<int> bookmarkedIndices = <int>{};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
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
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      NewsDetail(news),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(1.0, 0.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
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
                    child: NewsCachedImageWidget(news.imageUrl),
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
                          color: Colors.white),
                      onPressed: () {
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
          return buildShimmerEffectForSingleContainer();
        }
      },
    );
  }
}
