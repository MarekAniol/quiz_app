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
          // buildWhen: (previous, current) =>
          //     (previous.type != current.type) ||
          //     (previous.currentQuestionIndex != current.currentQuestionIndex),
          builder: (context, state) {
            return state.type.map(
                loading: () {
                  return const LoadingPage();
                },
                loaded: () {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        state.questionsList.questions[state.currentQuestionIndex].question,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                      BoxPredefined.verticalSizedBox30,
                      ...state.questionsList.questions[state.currentQuestionIndex]
                          .shuffledAnswers()
                          .map((answer) {
                        return AnswerButton(
                          onPressed: () {
                            context.read<QuestionsScreenBloc>().add(
                                  const QuestionsScreenEvent.questionAnswered(),
                                );
                          },
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
