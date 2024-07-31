import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_states.dart';
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
        leading: const Icon(Icons.menu, color: Colors.white),
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              welcomeBanner(),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return shimmerGridPlaceholder(6);
                    }
                    if (state is NewsLoaded) {
                      return NewsGridWidget(newsList: state.newsList,);
                    }
                    if (state is NewsError) {
                      return Center(child: Text('Error: ${state.message}'));
                    }
                    return const Center(child: Text('No data available'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
