import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/start_screen/start_screen.dart';

Route<dynamic> startScreenRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => const StartScreen(),
  );
}
