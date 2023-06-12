import 'package:quiz_app/domain/data_source/quiz_data_source.dart';
import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/locale/fake_api/quiz_fake_api.dart';
import 'package:quiz_app/locale/models/answers_list_local_model.dart';
import 'package:quiz_app/locale/models/questions_list_local_model.dart';

class QuizDataSourceImpl extends QuizDataSource {
  QuizDataSourceImpl({
    required QuizFakeApi quizFakeApi,
  }) : _quizFakeApi = quizFakeApi;

  final QuizFakeApi _quizFakeApi;

  @override
  Future<QuestionsListModel> getQuestionList() async {
    final questionsListLocalModel = await _quizFakeApi.getQuestionList();
    return questionsListLocalModel.toDomain();
  }

  @override
  Future<void> saveAnswersToFile({
    required AnswersListModel answersListModel,
  }) async {
    await _quizFakeApi.saveAnswersToFile(
      answersListModel,
    );
  }

  @override
  Future<AnswersListModel> getAnswersSummary() async {
    final answersListLocalModel = await _quizFakeApi.getAnswersSummary();
    return answersListLocalModel.toDomain();
  }
}
