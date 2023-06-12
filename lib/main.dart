import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/route/quiz_app_router.dart';
import 'package:quiz_app/quiz_app.dart';
import 'package:quiz_app/presentation/get_it_injector.dart' as injector;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injector.init();
  runApp(
    QuizApp(
      appRouter: QuizAppRouter(),
    ),
  );
}
