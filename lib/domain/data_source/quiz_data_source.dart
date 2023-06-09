import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';

abstract class QuizDataSource {
  Future<QuestionsListModel> getQuestionList();
  Future<void> saveAnswersToFile({required AnswersListModel answersListModel});
}
