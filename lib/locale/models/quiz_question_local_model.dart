import 'package:quiz_app/domain/models/quiz_question_model.dart';

class QuizQuestionLocalModel {
  const QuizQuestionLocalModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  final String question;
  final List<String> answers;
  final String correctAnswer;

  factory QuizQuestionLocalModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionLocalModel(
      question: json['question'] as String,
      answers: json['answers'].cast<String>(),
      correctAnswer: json['correctAnswer'] as String,
    );
  }
}

extension QuizQuestionLocalModelX on QuizQuestionLocalModel {
  QuizQuestionModel toDomain() {
    return QuizQuestionModel(
      question: question,
      answers: answers,
      correctAnswer: correctAnswer,
    );
  }
}
