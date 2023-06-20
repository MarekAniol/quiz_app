import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/core/extensions/state_type_extension.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/summary_screen/widgets/questions_summary.dart';
import 'package:quiz_app/presentation/screens/summary_screen/widgets/restart_quiz_button.dart';
import 'package:quiz_app/presentation/widgets/loading_page.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  static const String routeName = '/summary_screen';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
        builder: (context, state) {
          return state.stateType.map(
            loading: () => const LoadingPage(),
            loaded: () => BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.correctAnswersText,
                    ),
                    BoxPredefined.verticalSizedBox30,
                    const QuestionsSummary(),
                    BoxPredefined.verticalSizedBox30,
                    const RestartQuizButton(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
