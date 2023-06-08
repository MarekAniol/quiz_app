import 'package:freezed_annotation/freezed_annotation.dart';
part 'quiz_question_model.freezed.dart';

// class QuizQuestionModel {
//   const QuizQuestionModel({
//     required this.question,
//     required this.answers,
//     required this.correctAnswer,
//   });

//   final String question;
//   final List<String> answers;
//   final String correctAnswer;

//   factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
//     return QuizQuestionModel(
//       question: json['question'] as String,
//       answers: json['answers'].cast<String>(),
//       correctAnswer: json['correctAnswer'] as String,
//     );
//   }
// }

@freezed
class QuizQuestionModel with _$QuizQuestionModel {
  factory QuizQuestionModel({
    required String question,
    required List<String> answers,
    required String correctAnswer,
  }) = _QuizQuestionModel;

  final String question;
  final List<String> answers;
  final String correctAnswer;

  const QuizQuestionModel._();

  factory QuizQuestionModel.initial() => QuizQuestionModel(
        question: '',
        answers: [],
        correctAnswer: '',
      );
}
