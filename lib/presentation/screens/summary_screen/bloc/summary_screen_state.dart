part of 'summary_screen_bloc.dart';

@freezed
class SummaryScreenState with _$SummaryScreenState {
  factory SummaryScreenState({
    required StateType stateType,
    required AnswersListModel answersListModel,
  }) = _SummaryScreenState;

  factory SummaryScreenState.initial() => SummaryScreenState(
        stateType: StateType.loading,
        answersListModel: AnswersListModel.initial(),
      );
}
