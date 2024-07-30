import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_manoj/src/api_service/news_api_service.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app_manoj/src/constants/string_constants.dart';
import 'package:news_app_manoj/src/repo_service/news_list_repo_service.dart';
import 'dart:async';
import 'news_list_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        splashScreenLottie,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
      ),
    );
  }
}
