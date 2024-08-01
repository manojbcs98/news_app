import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_manoj/src/bloc/news_list_bloc/news_list_states.dart';
import 'package:news_app_manoj/src/constants/string_constants.dart';
import 'package:news_app_manoj/src/widgets/welcome_banner.dart';

void main() {
  testWidgets('WelcomeBanner Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WelcomeBanner(msg: pleaseWaitText), // Pass a NewsLoading instance
        ),
      ),
    );

    // Verify if "Welcome to News App!" text is present
    expect(find.text('Welcome to News App!'), findsOneWidget);

    // Verify if "Stay updated with the latest news and trends from around the world." text is present
    expect(
        find.text(
            'Stay updated with the latest news and trends from around the world.'),
        findsOneWidget);


    // Verify if the AnimatedTextKit is present
    expect(find.byType(AnimatedTextKit), findsOneWidget);

    // Verify if the AnimatedTextKit is showing "pleaseWaitText"
    expect(find.text('Please wait while we load'), findsOneWidget); // Adjust this based on the value of `pleaseWaitText`
  });
}
