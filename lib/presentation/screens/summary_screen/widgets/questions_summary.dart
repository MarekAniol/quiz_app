import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/constants/dimensiones.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';

// class QuestionsSummary extends StatelessWidget {
//   const QuestionsSummary({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SummaryScreenBloc, SummaryScreenState>(
//       builder: (context, state) {
//         return Column(
//           children: state.answersListModel.answers
//               .map(
//                 (answer) => Card(
//                   child: Row(
//                     children: [
//                       const Text("1"),
//                       Expanded(
//                         child: Column(
//                           children: [
//                             Text(
//                               answer.question,
//                             ),
//                             Text(
//                               answer.answer,
//                             ),
//                             Text(
//                               answer.correctAnswer,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//               .toList(),
//         );
//       },
//     );
//   }
// }

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
                  itemCount: state.answersListModel.answers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Row(
                        children: [
                          Text('$index'),
                          Expanded(
                            child: Column(
                              children: [
                                Text(state.answerByIndex(index).question),
                                Text(state.answerByIndex(index).answer),
                                Text(state.answerByIndex(index).correctAnswer),
                              ],
                            ),
                          ),
                        ],
                      ),
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
