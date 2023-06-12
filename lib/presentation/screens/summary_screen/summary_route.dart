import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/summary_screen/summary_screen.dart';

Route<dynamic> summaryRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => BlocProvider(
      create: (context) => injector<SummaryScreenBloc>()
        ..add(
          const SummaryScreenEvent.summaryScreenStarted(),
        ),
      child: const SummaryScreen(),
    ),
  );
}
