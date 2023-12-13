import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game/GameScreen.dart';
import 'onBoarding/OnBoardingScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboardingComplete = prefs.getBool('onboardingComplete') ?? false;

  runApp(MyApp(onboardingComplete: onboardingComplete));
}

class MyApp extends StatelessWidget {
  final bool onboardingComplete;

  const MyApp({Key? key, required this.onboardingComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onboardingComplete ? MainGameScreen() : const OnBoardingScreen(),
    );
  }
}
