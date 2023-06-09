import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/env_constants.dart';
import 'package:quiz_app/presentation/route/quiz_app_router.dart';
import 'package:quiz_app/quiz_app.dart';
import 'package:quiz_app/presentation/get_it_injector.dart' as injector;

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  injector.init(EnvironmentConfig.filePath);
  runApp(
    QuizApp(
      appRouter: QuizAppRouter(),
    ),
  );
}
