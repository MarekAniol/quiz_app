part of 'questions_screen_bloc.dart';

@freezed
class QuestionsScreenState with _$QuestionsScreenState {
  factory QuestionsScreenState({
    required QuestionsListModel questionsList,
    required StateType type,
  }) = _QuestionsScreenState;

  factory QuestionsScreenState.initial() => QuestionsScreenState(
        questionsList: QuestionsListModel.initial(),
        type: StateType.loading,
      );
}
