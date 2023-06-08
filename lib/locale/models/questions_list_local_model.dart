import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/locale/models/quiz_question_local_model.dart';

class QuestionsListLocalModel {
  const QuestionsListLocalModel({
    required this.questions,
  });

  final List<QuizQuestionLocalModel> questions;

  factory QuestionsListLocalModel.fromJson(List<dynamic> parsedJson) {
    late List<QuizQuestionLocalModel> questions;
    questions = parsedJson
        .map(
          (question) => QuizQuestionLocalModel.fromJson(
            question,
          ),
        )
        .toList();

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
