import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_states.dart';
import 'package:news_app_manoj/src/constants/string_constants.dart';
import 'package:news_app_manoj/src/widgets/shimmer.dart';
import 'package:news_app_manoj/src/widgets/welcome_banner.dart';
import 'grid_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<NewsCubit>().fetchNews();
      }
    });

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<NewsCubit>().fetchNews();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white, size: 25),
        title: const Center(
          child: Text(
            appBarText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(Icons.verified_user, size: 20),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              Widget content;

              // Display the WelcomeBanner only in the loading and loaded states
              if (state is NewsLoading) {
                content = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WelcomeBanner(msg: pleaseWaitText),
                    const SizedBox(height: 20),
                    Expanded(child: ShimmerGridPlaceholder(6)),
                  ],
                );
              }
              if (state is NewsLoaded) {
                content = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WelcomeBanner(msg: scrollText),
                    const SizedBox(height: 20),
                    Expanded(child: NewsGridWidget(newsList: state.newsList)),
                  ],
                );
              } else if (state is NewsError) {
                content = Center(
                    child: Text(
                        '$errorText ${state.message}')); // Show error message
              } else {
                content = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WelcomeBanner(msg: pleaseWaitText),
                    const SizedBox(height: 20),
                    Expanded(child: ShimmerGridPlaceholder(4)),
                  ],
                );
              }

              return content;
            },
          ),
        ),
      ),
    );
  }
}
