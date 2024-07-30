import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/api_service/news_api_service.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app_manoj/src/repo_service/news_list_repo_service.dart';
import 'package:news_app_manoj/src/widgets/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => NewsCubit(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
