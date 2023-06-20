import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/core/extensions/state_type_extension.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';
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
          return state.stateType.map(loading: () {
            return const LoadingPage();
          }, loaded: () {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Summary Screen")],
            );
          });
        },
      ),
    );
  }
}
