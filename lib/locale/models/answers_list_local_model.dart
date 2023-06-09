import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/locale/models/answer_local_model.dart';

class AnswersListLocalModel {
  const AnswersListLocalModel({
    required this.answers,
  });

  final List<AnswerLocalModel> answers;

  factory AnswersListLocalModel.fromJson(Map<String, dynamic> parsedJson) {
    final List<dynamic> list = parsedJson['Answers'] as List;
    List<AnswerLocalModel> answers =
        list.map((answer) => AnswerLocalModel.fromJson(answer)).toList();

    return AnswersListLocalModel(
      answers: answers,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['answers'] = answers.map((answer) => answer.toJson()).toList();

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
    );
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
    );
  }
}
