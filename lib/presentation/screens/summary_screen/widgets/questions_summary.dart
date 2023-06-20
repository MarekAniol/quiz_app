import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/colors.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/core/extensions/paddings.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
      builder: (context, state) {
        return SizedBox(
          height: Dimensiones.answersBoxHeight,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: context.listOfAnswersPadding,
                  itemCount: state.answersListModel.answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        if (index != 0)
                          const Divider(
                            color: AppColors.greyBlack,
                          ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _QuestionNumber(index: index),
                            BoxPredefined.horizontalSizedBox10,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.questionByIndex(index),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    state.answerByIndex(index),
                                    style: TextStyle(
                                      color: state.setColorByAnswer(index),
                                    ),
                                  ),
                                  Text(
                                    state.correctAnswerByIndex(index),
                                    style: const TextStyle(
                                      color: AppColors.primaryGreenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuestionNumber extends StatelessWidget {
  const _QuestionNumber({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          width: Dimensiones.answerNumber,
          height: Dimensiones.answerNumber,
          decoration: BoxDecoration(
            color: state.setColorByAnswer(index),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Text(
            '${state.questionNumber(index)}',
            style: const TextStyle(
              color: AppColors.greyWhite,
            ),
          ),
        );
      },
    );
  }
}
