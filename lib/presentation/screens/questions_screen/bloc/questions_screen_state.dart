part of 'questions_screen_bloc.dart';

@freezed
class QuestionsScreenState with _$QuestionsScreenState {
  factory QuestionsScreenState({
    required QuestionsListModel questionsListModel,
    required int currentQuestionIndex,
    required StateType type,
    required List<AnswerModel> answers,
  }) = _QuestionsScreenState;

  QuestionsScreenState._();

  factory QuestionsScreenState.initial() => QuestionsScreenState(
        questionsListModel: QuestionsListModel.initial(),
        currentQuestionIndex: 0,
        type: StateType.loading,
        answers: [],
      );

  bool get isQuizComplete =>
      (currentQuestionIndex == questionsListModel.questions.length) &&
      (questionsListModel.questions.isNotEmpty);
  bool get hasReachedEndOfQuestions => currentQuestionIndex == questionsListModel.questions.length;
  bool get isNotLastQuestion => currentQuestionIndex < questionsListModel.questions.length - 1;
  QuizQuestionModel get currentQuestionModel => questionsListModel.questions[currentQuestionIndex];
  String get currentQuestionText => currentQuestionModel.question;
  String get correctAnswer => currentQuestionModel.correctAnswer;
}

extension BuildWhenQuestionScreenExtension on BuildContext {
  bool Function(
    QuestionsScreenState previous,
    QuestionsScreenState current,
  )? buildWhenQuestionScreen() {
    return (previous, current) =>
        // (previous.type != current.type) ||
        (previous.currentQuestionIndex != current.currentQuestionIndex);
  }
}
