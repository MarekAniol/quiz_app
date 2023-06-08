import 'package:quiz_app/domain/data_source/questions_list_data_source.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/locale/models/questions_list_local_model.dart';

abstract class QuestionsFakeApi {
  QuestionsListLocalModel getQuestionList();
}

class QuestionsFakeApiImpl implements QuestionsListDataSource {
  QuestionsFakeApiImpl({
    required QuestionsFakeApi questionsFakeApi,
  }) : _questionsFakeApi = questionsFakeApi;

  final QuestionsFakeApi _questionsFakeApi;

  @override
  QuestionsListModel getQuestionList() {
    final quationsListLocalModel = _questionsFakeApi.getQuestionList();
    return quationsListLocalModel.toDomain();
  }
}
