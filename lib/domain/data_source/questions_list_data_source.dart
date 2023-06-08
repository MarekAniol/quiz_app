import 'package:quiz_app/domain/models/questions_list_model.dart';

abstract class QuestionsListDataSource {
  Future<QuestionsListModel> getQuestionList();
}
