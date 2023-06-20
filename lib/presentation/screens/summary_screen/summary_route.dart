import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/summary_screen/summary_screen.dart';

Route<dynamic> summaryRoute(RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        BlocProvider(
      create: (context) => injector<SummaryScreenBloc>()
        ..add(
          const SummaryScreenEvent.summaryScreenStarted(),
        ),
      child: const SummaryScreen(),
    ),
    transitionsBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 2.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(1, -5.0),
            ).animate(secondaryAnimation),
            child: child,
          ));
    },
  );
}
