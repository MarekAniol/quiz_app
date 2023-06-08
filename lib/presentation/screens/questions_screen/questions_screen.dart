import 'package:flutter/material.dart';
import 'package:quiz_app/core/constants/colors.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/presentation/screens/questions_screen/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  static const String routeName = '/question_screen';

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Question",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30,
              ),
            ),
            BoxPredefined.verticalSizedBox30,
            AnswerButton(
              onPressed: () {},
              answerText: 'Answer 1',
            ),
            AnswerButton(
              onPressed: () {},
              answerText: 'Answer 2',
            ),
            AnswerButton(
              onPressed: () {},
              answerText: 'Answer 3',
            ),
            AnswerButton(
              onPressed: () {},
              answerText: 'Answer 4',
            ),
          ],
        ));
  }
}
