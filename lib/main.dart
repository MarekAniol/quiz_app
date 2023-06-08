import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/route/quiz_app_router.dart';
import 'package:quiz_app/quiz_app.dart';

void main() {
  runApp(
    QuizApp(
      appRouter: QuizAppRouter(),
    ),
  );
}
