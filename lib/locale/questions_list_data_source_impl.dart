import 'package:quiz_app/domain/data_source/questions_list_data_source.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/locale/fake_api/questions_fake_api.dart';
import 'package:quiz_app/locale/models/questions_list_local_model.dart';

class QuestionListDataSourceImpl extends QuestionsListDataSource {
  QuestionListDataSourceImpl({
    required QuestionsFakeApi questionsFakeApi,
  }) : _questionsFakeApi = questionsFakeApi;

  final QuestionsFakeApi _questionsFakeApi;

  @override
  Future<QuestionsListModel> getQuestionList() async {
    final questionsListLocalModel = await _questionsFakeApi.getQuestionList();
    return questionsListLocalModel.toDomain();
  }
}
