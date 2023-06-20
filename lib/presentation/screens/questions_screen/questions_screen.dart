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
      child: BlocConsumer<QuestionsScreenBloc, QuestionsScreenState>(
        listenWhen: (previous, current) => current.hasReachedEndOfQuestions,
        listener: (context, state) => state.isQuizComplete
            ? Navigator.pushReplacementNamed(
                context,
                '/summary_screen',
              )
            : null,
        // buildWhen: (previous, current) => current.type != previous.type,
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
                    state.currentQuestionText,
                    style: const TextStyle(
                      color: AppColors.greyBlack,
                      fontSize: 14,
                    ),
                  ),
                  BoxPredefined.verticalSizedBox30,
                  ...state.currentQuestionModel.shuffledAnswers().map((
                    answer,
                  ) {
                    return AnswerButton(
                      onPressed: () {
                        context.read<QuestionsScreenBloc>().add(
                              QuestionsScreenEvent.questionAnswered(
                                answer: answer,
                              ),
                            );
                      },
                      answerText: answer,
                    );
                  }),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
