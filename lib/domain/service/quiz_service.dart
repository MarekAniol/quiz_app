import 'package:quiz_app/domain/data_source/quiz_data_source.dart';
import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';

class QuizService {
  QuizService({
    required QuizDataSource quizDataSource,
  }) : _quizDataSource = quizDataSource;

  final QuizDataSource _quizDataSource;

  Future<QuestionsListModel> getQuestionList() async {
    return await _quizDataSource.getQuestionList();
  }

  Future<void> saveAnswersToFile({
    required AnswersListModel answersListModel,
  }) async {
    return await _quizDataSource.saveAnswersToFile(
      answersListModel: answersListModel,
    );
  }
}
