import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_states.dart';
import 'package:news_app_manoj/src/models/news_list_model.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
        title: const Center(
          child: Text(
            "News App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "0",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is NewsLoading) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    welcomeSectionUI(),
                    SizedBox(height: 20),
                    Expanded(child: shimmerGridPlaceholder(8)),
                  ],
                ),
              ),
            );
          }
          if (state is NewsLoaded) {
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    welcomeSectionUI(),
                    SizedBox(height: 20),
                    gridViewData(state.newsList),
                  ],
                ),
              ),
            );
          }

          return Center(child: Text('No data available'));
        },
      ),
    );
  }

  Widget welcomeSectionUI() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage('assets/images/news_background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Text(
                "Welcome to News App!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              const Text(
                "Stay updated with the latest news and trends from around the world.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        'Scroll to read the latest News',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: [Colors.blue, Colors.purple, Colors.orange],
                        speed: Duration(milliseconds: 200),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget gridViewData(List<News> newsList) {
    return Expanded(
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: newsList
            .map((news) => Card(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(news.imageUrl),
                        // Use NetworkImage for online images
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              // Implement your bookmark logic here
                            });
                          },
                          color: Colors.white,
                          height: 35,
                          minWidth: 35,
                          padding: EdgeInsets.all(0),
                          shape: CircleBorder(),
                          child: Icon(
                            // You might want to handle bookmark status differently
                            news.relevanceScore != null // Example condition
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            size: 22,
                            color: news.relevanceScore != null
                                ? Colors.yellow[700]
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget shimmerGridPlaceholder(int count) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: count, // Number of shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 20,
                  color: Colors.white,
                ),
                SizedBox(height: 4),
                Container(
                  height: 16,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
