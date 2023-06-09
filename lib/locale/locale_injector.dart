import 'package:get_it/get_it.dart';
import 'package:quiz_app/domain/data_source/questions_list_data_source.dart';
import 'package:quiz_app/locale/fake_api/questions_fake_api.dart';
import 'package:quiz_app/locale/questions_list_data_source_impl.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';

extension LocaleInector on GetIt {
  void registerLocale({
    required String filePath,
  }) {
    this
      .._registerFakeApi(filePath)
      ..registerFactory<QuestionsListDataSource>(
        () => QuestionListDataSourceImpl(
          questionsFakeApi: injector(),
        ),
      );
  }

  void _registerFakeApi(String filePath) {
    registerFactory<QuestionsFakeApi>(
      () => QuestionsFakeApiImpl(filePath: filePath),
    );
  }
}
