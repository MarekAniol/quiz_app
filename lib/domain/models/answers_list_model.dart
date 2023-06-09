import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/domain/models/answer_model.dart';
part 'answers_list_model.freezed.dart';

@freezed
class AnswersListModel with _$AnswersListModel {
  factory AnswersListModel({
    required List<AnswerModel> answers,
  }) = _AnswersListModel;

  const AnswersListModel._();

  factory AnswersListModel.initial() => AnswersListModel(
        answers: [],
      );
}
