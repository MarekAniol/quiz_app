import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_question_model.freezed.dart';

@freezed
class QuizQuestionModel with _$QuizQuestionModel {
  factory QuizQuestionModel({
    required String question,
    required List<String> answers,
    required String correctAnswer,
  }) = _QuizQuestionModel;

  const QuizQuestionModel._();

  factory QuizQuestionModel.initial() => QuizQuestionModel(
        question: '',
        answers: [],
        correctAnswer: '',
      );
}
