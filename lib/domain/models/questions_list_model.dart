import 'package:quiz_app/domain/models/quiz_question_model.dart';

class QuestionsListModel {
  QuestionsListModel({
    required this.questions,
  });

  final List<QuizQuestionModel> questions;

  factory QuestionsListModel.fromJson(List<dynamic> parsedJson) {
    late List<QuizQuestionModel> questions;
    questions = parsedJson
        .map(
          (question) => QuizQuestionModel.fromJson(
            question,
          ),
        )
        .toList();

    return QuestionsListModel(
      questions: questions,
    );
  }
}
