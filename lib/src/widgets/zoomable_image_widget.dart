import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';

class ZoomableImage extends StatelessWidget {
  final String imageUrl;

  const ZoomableImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: PhotoView(
                imageProvider: CachedNetworkImageProvider(imageUrl),
                backgroundDecoration: BoxDecoration(
                  color: Colors.grey[600],
                ),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2.0,
                enableRotation: true,
                initialScale: PhotoViewComputedScale.contained,
                loadingBuilder: (context, event) {
                  return Center(
                    child: CircularProgressIndicator(
                      value: event == null
                          ? null
                          : event.cumulativeBytesLoaded /
                          event.expectedTotalBytes!,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.blueGrey.withOpacity(0.1), // Adjust opacity and color as needed
                  ],
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Pinch to Zoom',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.zoom_out_map,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

