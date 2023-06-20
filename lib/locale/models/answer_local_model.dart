import 'package:quiz_app/domain/models/answer_model.dart';

class AnswerLocalModel {
  const AnswerLocalModel({
    required this.question,
    required this.answer,
    required this.isAnswerCorrect,
    required this.correctAnswer,
  });

  final String question;
  final String answer;
  final bool? isAnswerCorrect;
  final String correctAnswer;

  factory AnswerLocalModel.fromJson(Map<String, dynamic> json) {
    return AnswerLocalModel(
      question: json['question'] as String,
      answer: json['answer'] as String,
      isAnswerCorrect: json['isAnswerCorrect'] as bool?,
      correctAnswer: json['correctAnswer'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['isAnswerCorrect'] = isAnswerCorrect;
    data['correctAnswer'] = correctAnswer;
    return data;
  }
}

extension AnswerLocalModelX on AnswerLocalModel {
  AnswerModel toDomain() {
    return AnswerModel(
      question: question,
      answer: answer,
      isAnswerCorrect: isAnswerCorrect ?? false,
      correctAnswer: correctAnswer,
    );
  }
}

extension AnswerModelX on AnswerModel {
  AnswerLocalModel toLocale() {
    return AnswerLocalModel(
      question: question,
      answer: answer,
      isAnswerCorrect: isAnswerCorrect,
      correctAnswer: correctAnswer,
    );
  }
}
