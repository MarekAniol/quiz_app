import 'package:get_it/get_it.dart';
import 'package:quiz_app/domain/data_source/quiz_data_source.dart';
import 'package:quiz_app/locale/fake_api/quiz_fake_api.dart';
import 'package:quiz_app/locale/quiz_data_source_impl.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';

extension LocaleInector on GetIt {
  void registerLocale({
    required String filePath,
  }) {
    this
      .._registerFakeApi(filePath)
      ..registerFactory<QuizDataSource>(
        () => QuizDataSourceImpl(
          quizFakeApi: injector(),
        ),
      );
  }

  void _registerFakeApi(String filePath) {
    registerFactory<QuizFakeApi>(
      () => QuizFakeApiImpl(filePath: filePath),
    );
  }
}
