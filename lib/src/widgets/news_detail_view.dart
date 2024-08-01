import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';
import 'package:news_app_manoj/src/widgets/zoomable_image_widget.dart';
import 'cached_image.dart';

class NewsDetail extends StatefulWidget {
  final News news;

  const NewsDetail(this.news, {Key? key}) : super(key: key);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  void _navigateToZoomableImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ZoomableImage(imageUrl: widget.news.imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () => _navigateToZoomableImage(context),
                    child: Hero(
                      tag: widget.news.imageUrl,
                      child: NewsCachedImageWidget(widget.news.imageUrl),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black54,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.news.title,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Title text color
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.news.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white, // Description text color
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
