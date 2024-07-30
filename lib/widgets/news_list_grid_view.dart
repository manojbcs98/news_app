import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _listItem = [
    {"image": 'assets/images/two.jpg', "isSaved": false},
    {"image": 'assets/images/three.jpg', "isSaved": false},
    {"image": 'assets/images/four.jpg', "isSaved": true},
    {"image": 'assets/images/five.jpg', "isSaved": true},
    {"image": 'assets/images/one.jpg', "isSaved": false},
    {"image": 'assets/images/two.jpg', "isSaved": false},
    {"image": 'assets/images/three.jpg', "isSaved": false},
    {"image": 'assets/images/four.jpg', "isSaved": false},
    {"image": 'assets/images/five.jpg', "isSaved": false},
    {"image": 'assets/images/two.jpg', "isSaved": false},
    {"image": 'assets/images/three.jpg', "isSaved": false},
    {"image": 'assets/images/four.jpg', "isSaved": true},
    {"image": 'assets/images/five.jpg', "isSaved": true},
    {"image": 'assets/images/one.jpg', "isSaved": false},
    {"image": 'assets/images/two.jpg', "isSaved": false},
    {"image": 'assets/images/three.jpg', "isSaved": false},
    {"image": 'assets/images/four.jpg', "isSaved": false},
    {"image": 'assets/images/five.jpg', "isSaved": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Center(
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
              child: Center(
                child: Text(
                  "0",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
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
                    padding: const EdgeInsets.all(10.0), // Adjusted padding
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Welcome to News App!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24, // Slightly smaller font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8), // Reduced space
                        Text(
                          "Stay updated with the latest news and trends from around the world.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14, // Slightly smaller font size
                          ),
                        ),
                        SizedBox(height: 15), // Adjusted spacing
                        Container(
                          padding: EdgeInsets.all(8), // Reduced padding
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
                                  colors: [
                                    Colors.blue,
                                    Colors.purple,
                                    Colors.orange
                                  ],
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
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _listItem
                      .map((item) => Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(item["image"]),
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
                                        item["isSaved"] = !item["isSaved"];
                                      });
                                    },
                                    color: Colors.white,
                                    height: 35,
                                    minWidth: 35,
                                    padding: EdgeInsets.all(0),
                                    shape: CircleBorder(),
                                    child: Icon(
                                      item["isSaved"]
                                          ? Icons.bookmark
                                          : Icons.bookmark_border,
                                      size: 22,
                                      color: item["isSaved"]
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
