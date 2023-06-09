import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';
import 'package:quiz_app/presentation/screens/questions_screen/bloc/questions_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/questions_screen/questions_screen.dart';

Route<dynamic> questionRoute(RouteSettings settings) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => BlocProvider(
      create: (context) => injector<QuestionsScreenBloc>()
        ..add(
          const QuestionsScreenEvent.questionsScreenStarted(),
        ),
      child: const QuestionsScreen(),
    ),
  );
}
