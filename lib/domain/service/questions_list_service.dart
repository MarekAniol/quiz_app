import 'package:quiz_app/domain/data_source/questions_list_data_source.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';

class QuestionsListService {
  QuestionsListService({
    required QuestionsListDataSource questionsListDataSource,
  }) : _questionsListDataSource = questionsListDataSource;

  final QuestionsListDataSource _questionsListDataSource;

  Future<QuestionsListModel> getQuestionList() async {
    return await _questionsListDataSource.getQuestionList();
  }
}
