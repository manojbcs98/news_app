import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_manoj/constants/string_constants.dart';
import 'dart:async';
import 'news_list_grid_view.dart';

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
