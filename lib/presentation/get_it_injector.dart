import 'package:get_it/get_it.dart';
import 'package:quiz_app/domain/domain_injector.dart';
import 'package:quiz_app/locale/locale_injector.dart';
import 'package:quiz_app/presentation/screens/questions_screen/bloc/questions_screen_bloc.dart';
import 'package:quiz_app/presentation/screens/summary_screen/bloc/summary_screen_bloc.dart';

final injector = GetIt.instance;

void init() {
  injector
    ..registerDomain()
    ..registerLocale()
    ..registerFactory<QuestionsScreenBloc>(
      () => QuestionsScreenBloc(
        quizListService: injector(),
      ),
    )
    ..registerFactory<SummaryScreenBloc>(
      () => SummaryScreenBloc(
        quizListService: injector(),
      ),
    );
}
