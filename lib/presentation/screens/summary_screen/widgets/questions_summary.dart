import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/borders.dart';
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
                        if (!state.isFirstQuestion(index))
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
                                  BoxPredefined.verticalSizedBox6,
                                  Text(
                                    state.answerByIndex(index),
                                    style: TextStyle(
                                      color: state.setColorByAnswer(index),
                                    ),
                                  ),
                                  _CorrectAnswerHiden(
                                    index: index,
                                  ),
                                ],
                              ),
                            ),
                            BoxPredefined.horizontalSizedBox10,
                            Icon(
                              state.setIconByAnswer(index),
                              color: state.setColorByAnswer(index),
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
            borderRadius: Borders.all100,
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

class _CorrectAnswerHiden extends StatefulWidget {
  const _CorrectAnswerHiden({
    required this.index,
  });

  final int index;

  @override
  State<_CorrectAnswerHiden> createState() => _CorrectAnswerHidenState();
}

class _CorrectAnswerHidenState extends State<_CorrectAnswerHiden> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isVisible = false;
        });
      },
      child: BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
        builder: (context, stateScreen) {
          return BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: (_isVisible && !state.isAnswerCorrect(widget.index))
                          ? AppColors.primaryGreenColor
                          : Colors.transparent,
                      borderRadius: Borders.all12,
                    ),
                    child: Text(
                      stateScreen.correctAnswerByIndex(widget.index),
                      style: const TextStyle(
                        color: AppColors.primaryGreenColor,
                      ),
                    ),
                  ),
                  if (_isVisible && !state.isAnswerCorrect(widget.index))
                    const Text(
                      'Show answer',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
