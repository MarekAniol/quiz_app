part of 'questions_screen_bloc.dart';

@freezed
class QuestionsScreenState with _$QuestionsScreenState {
  factory QuestionsScreenState({
    required QuestionsListModel questionsList,
    required int currentQuestionIndex,
    required StateType type,
  }) = _QuestionsScreenState;

  factory QuestionsScreenState.initial() => QuestionsScreenState(
        questionsList: QuestionsListModel.initial(),
        currentQuestionIndex: 0,
        type: StateType.loading,
      );
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
