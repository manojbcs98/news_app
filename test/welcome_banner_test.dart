import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_app_manoj/src/widgets/welcome_banner.dart';

void main() {
  testWidgets('WelcomeBanner Widget Test', (WidgetTester tester) async {
    // Build the WelcomeBanner widget
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: WelcomeBanner(),
      ),
    ));

    // Verify if "Welcome to News App!" text is present
    expect(find.text('Welcome to News App!'), findsOneWidget);

    // Verify if "Stay updated with the latest news and trends from around the world." text is present
    expect(
        find.text(
            'Stay updated with the latest news and trends from around the world.'),
        findsOneWidget);

    // Verify if "Scroll to read the latest News" text is present
    expect(find.text('Scroll to read the latest News'), findsOneWidget);

    // Verify if the AnimatedTextKit is present
    expect(find.byType(AnimatedTextKit), findsOneWidget);


  });
}
