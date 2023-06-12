import 'package:quiz_app/domain/models/answer_model.dart';

class AnswerLocalModel {
  const AnswerLocalModel({
    required this.question,
    required this.answer,
    required this.isAnswerCorrect,
  });

  final String question;
  final String answer;
  final bool? isAnswerCorrect;

  factory AnswerLocalModel.fromJson(Map<String, dynamic> json) {
    return AnswerLocalModel(
      question: json['question'] as String,
      answer: json['answer'] as String,
      isAnswerCorrect: json['isAnswerCorrect'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    data['isAnswerCorrect'] = isAnswerCorrect;
    return data;
  }
}

extension AnswerLocalModelX on AnswerLocalModel {
  AnswerModel toDomain() {
    return AnswerModel(
      question: question,
      answer: answer,
      isAnswerCorrect: isAnswerCorrect ?? false,
    );
  }
}

extension AnswerModelX on AnswerModel {
  AnswerLocalModel toLocale() {
    return AnswerLocalModel(
      question: question,
      answer: answer,
      isAnswerCorrect: isAnswerCorrect,
    );
  }
}
