part of 'questions_screen_bloc.dart';

@freezed
class QuestionsScreenEvent with _$QuestionsScreenEvent {
  const factory QuestionsScreenEvent.questionsScreenStarted() = _QuestionsScreenStarted;
  const factory QuestionsScreenEvent.questionReaded() = _QuestionsReaded;
}
