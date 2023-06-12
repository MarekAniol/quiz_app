part of 'questions_screen_bloc.dart';

@freezed
class QuestionsScreenState with _$QuestionsScreenState {
  factory QuestionsScreenState({
    required QuestionsListModel questionsList,
    required int currentQuestionIndex,
    required StateType type,
    required List<AnswerModel> answers,
  }) = _QuestionsScreenState;

  QuestionsScreenState._();

  factory QuestionsScreenState.initial() => QuestionsScreenState(
        questionsList: QuestionsListModel.initial(),
        currentQuestionIndex: 0,
        type: StateType.loading,
        answers: [],
      );

  bool get isQuizComplete =>
      (currentQuestionIndex == questionsList.questions.length) &&
      (questionsList.questions.isNotEmpty);

  bool get hasReachedEndOfQuestions => currentQuestionIndex == questionsList.questions.length;
  QuizQuestionModel get currentQuestionModel => questionsList.questions[currentQuestionIndex];
  String get currentQuestionText => currentQuestionModel.question;
}

extension BuildWhenQuestionScreenExtension on BuildContext {
  bool Function(
    QuestionsScreenState previous,
    QuestionsScreenState current,
  )? buildWhenQuestionScreen() {
    return (previous, current) =>
        (previous.type != current.type) ||
        (previous.currentQuestionIndex != current.currentQuestionIndex);
  }
}
