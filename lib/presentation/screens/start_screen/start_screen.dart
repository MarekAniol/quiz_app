import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/presentation/screens/start_screen/widgets/question_marks.dart';
import 'package:quiz_app/presentation/screens/start_screen/widgets/start_quiz_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const String routeName = '/start_screen';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const QuestionMarksWidget(),
          BoxPredefined.verticalSizedBox50,
          const StartQuizButton(),
        ],
      ),
    );
  }
}
