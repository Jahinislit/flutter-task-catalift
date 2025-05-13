import 'package:flutter/material.dart';
import 'screens/interests_screen.dart';
import 'core/constants.dart';

void main() {
  runApp(const OnboardingApp());
}

class OnboardingApp extends StatelessWidget {
  const OnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      home: const InterestsScreen(),
    );
  }
}

