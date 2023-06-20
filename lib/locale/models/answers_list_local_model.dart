import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/locale/models/answer_local_model.dart';

class AnswersListLocalModel {
  const AnswersListLocalModel({
    required this.answers,
    required this.correctAnswersCount,
  });

  final List<AnswerLocalModel> answers;
  final int correctAnswersCount;

  factory AnswersListLocalModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['answers'] as List;
    final int correctAnswersCount = json['correctAnswersCount'] as int;
    List<AnswerLocalModel> answers =
        list.map((answer) => AnswerLocalModel.fromJson(answer)).toList();

    return AnswersListLocalModel(
      answers: answers,
      correctAnswersCount: correctAnswersCount,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['answers'] = answers.map((answer) => answer.toJson()).toList();
    data['correctAnswersCount'] = correctAnswersCount;

    return data;
  }
}

extension AnswersListLocalModelX on AnswersListLocalModel {
  AnswersListModel toDomain() {
    return AnswersListModel(
        answers: answers
            .map(
              (answer) => answer.toDomain(),
            )
            .toList(),
        correctAnswersCount: correctAnswersCount);
  }
}

extension AnswersListModelX on AnswersListModel {
  AnswersListLocalModel toLocale() {
    return AnswersListLocalModel(
      answers: answers
          .map(
            (answer) => answer.toLocale(),
          )
          .toList(),
      correctAnswersCount: correctAnswersCount,
    );
  }
}
