class QuizQuestionModel {
  const QuizQuestionModel({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  final String question;
  final List<String> answers;
  final String correctAnswer;

  factory QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    return QuizQuestionModel(
      question: json['question'] as String,
      answers: json['answers'].cast<String>(),
      correctAnswer: json['correctAnswer'] as String,
    );
  }
}
