import 'package:get_it/get_it.dart';
import 'package:quiz_app/domain/service/questions_list_service.dart';
import 'package:quiz_app/presentation/get_it_injector.dart';

extension DomainInjector on GetIt {
  void registerDomain() {
    registerLazySingleton<QuestionsListService>(
      () => QuestionsListService(
        questionsListDataSource: injector(),
      ),
    );
  }
}
