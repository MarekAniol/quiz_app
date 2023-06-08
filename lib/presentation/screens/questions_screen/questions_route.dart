import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/questions_screen/questions_screen.dart';

Route<dynamic> questionRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      return const QuestionsScreen();
    },
  );
}
