import 'package:flutter/material.dart';
import 'package:quiz_app/presentation/route/quiz_app_router.dart';
import 'package:quiz_app/presentation/widgets/app_gradient.dart';
import 'package:quiz_app/presentation/widgets/app_padding.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({
    required this.appRouter,
    super.key,
  });

  final QuizAppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeAnimationCurve: Curves.easeInToLinear,
      onGenerateRoute: appRouter.route,
      builder: (context, child) => Scaffold(
        body: AppGradient(
          child: AppPadding(
            child: child,
          ),
        ),
      ),
    );
  }
}
