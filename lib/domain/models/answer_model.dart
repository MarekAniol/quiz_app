import 'package:freezed_annotation/freezed_annotation.dart';
part 'answer_model.freezed.dart';

@freezed
class AnswerModel with _$AnswerModel {
  factory AnswerModel({
    required String question,
    required String answer,
    required bool isAnswerCorrect,
    required String correctAnswer,
  }) = _AnswerModel;

  const AnswerModel._();

  factory AnswerModel.initial() => AnswerModel(
        question: '',
        answer: '',
        isAnswerCorrect: false,
        correctAnswer: '',
      );
}
