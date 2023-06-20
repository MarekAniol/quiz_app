import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';
import 'package:quiz_app/presentation/screens/questions_screen/bloc/questions_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/questions_screen/questions_screen.dart';

Route<dynamic> questionRoute(RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (
      context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) =>
        BlocProvider(
      create: (context) => injector<QuestionsScreenBloc>()
        ..add(
          const QuestionsScreenEvent.questionsScreenStarted(),
        ),
      child: const QuestionsScreen(),
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
