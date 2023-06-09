import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/colors.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/core/extensions/state_type_extension.dart';
import 'package:quiz_app/presentation/screens/questions_screen/bloc/questions_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/questions_screen/widgets/answer_button.dart';
import 'package:quiz_app/presentation/widgets/loading_page.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({super.key});

  static const String routeName = '/question_screen';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: BlocBuilder<QuestionsScreenBloc, QuestionsScreenState>(
          builder: (context, state) {
            return state.type.map(
                loading: () => const LoadingPage(),
                loaded: () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        state.questionsList.questions[0].question,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 30,
                        ),
                      ),
                      BoxPredefined.verticalSizedBox30,
                      ...state.questionsList.questions[0].answers.map((answer) {
                        return AnswerButton(
                          onPressed: () {},
                          answerText: answer,
                        );
                      }),
                    ],
                  );
                },
                error: () => const LoadingPage());
          },
        ));
  }
}
