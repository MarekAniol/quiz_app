import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/screens/questions_screen/questions_route.dart';
import 'package:quiz_app/presentation/screens/questions_screen/questions_screen.dart';
import 'package:quiz_app/presentation/screens/start_screen/start_screen.dart';
import 'package:quiz_app/presentation/screens/start_screen/start_screen_route.dart';
import 'package:quiz_app/presentation/screens/summary_screen/summary_route.dart';
import 'package:quiz_app/presentation/screens/summary_screen/summary_screen.dart';

class QuizAppRouter {
  Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case Navigator.defaultRouteName:
      case StartScreen.routeName:
        return startScreenRoute(settings);
      case QuestionsScreen.routeName:
        return questionRoute(settings);
      case SummaryScreen.routeName:
        return summaryRoute(settings);
      default:
        return startScreenRoute(settings);
    }
  }
}
