import 'package:get_it/get_it.dart';
import 'package:quiz_app/domain/domain_injector.dart';
import 'package:quiz_app/locale/locale_injector.dart';
import 'package:quiz_app/presentation/screens/questions_screen/bloc/questions_screen_bloc.dart';

final injector = GetIt.instance;

void init(String filePath) {
  injector
    ..registerDomain()
    ..registerLocale(
      filePath: filePath,
    )
    ..registerFactory<QuestionsScreenBloc>(
      () => QuestionsScreenBloc(
        questionsListService: injector(),
      ),
    );
}
