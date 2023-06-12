import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/locale/models/quiz_question_local_model.dart';

class QuestionsListLocalModel {
  const QuestionsListLocalModel({
    required this.questions,
  });

  final List<QuizQuestionLocalModel> questions;

  factory QuestionsListLocalModel.fromJson(Map<String, dynamic> parsedJson) {
    final List<dynamic> list = parsedJson['questions'] as List;
    List<QuizQuestionLocalModel> questions =
        list.map((question) => QuizQuestionLocalModel.fromJson(question)).toList();

    return QuestionsListLocalModel(
      questions: questions,
    );
  }
}

extension QuestionsListLocalModelX on QuestionsListLocalModel {
  QuestionsListModel toDomain() {
    return QuestionsListModel(
      questions: questions
          .map(
            (question) => question.toDomain(),
          )
          .toList(),
    );
  }
}
