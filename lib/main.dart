import 'package:flutter/material.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_bloc.dart';
import 'package:news_app_manoj/src/constants/api_constants.dart';
import 'package:news_app_manoj/src/constants/string_constants.dart';
import 'package:news_app_manoj/src/utilities/secure_storage.dart';
import 'package:news_app_manoj/src/widgets/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SecureStorageUtil storageUtil = SecureStorageUtil();
  await storageUtil.saveApiToken(kAPIToken);
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
      title: demoTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
