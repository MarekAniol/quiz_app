part of 'summary_screen_bloc.dart';

@freezed
class SummaryScreenState with _$SummaryScreenState {
  factory SummaryScreenState({
    required StateType stateType,
    required AnswersListModel answersListModel,
  }) = _SummaryScreenState;

  SummaryScreenState._();

  factory SummaryScreenState.initial() => SummaryScreenState(
        stateType: StateType.loading,
        answersListModel: AnswersListModel.initial(),
      );

  int get correctAnswers => answersListModel.correctAnswersCount;
  int get totalQuestions => answersListModel.answers.length;

  String get correctAnswersText =>
      'You answered $correctAnswers out of $totalQuestions questions correctly';

  AnswerModel answerByIndex(int index) => answersListModel.answers[index];
}
