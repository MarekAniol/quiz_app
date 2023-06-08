import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/domain/models/quiz_question_model.dart';
part 'questions_list_model.freezed.dart';

@freezed
class QuestionsListModel with _$QuestionsListModel {
  factory QuestionsListModel({
    required List<QuizQuestionModel> questions,
  }) = _QuestionsListModel;

  const QuestionsListModel._();

  factory QuestionsListModel.initial() => QuestionsListModel(
        questions: [],
      );
}
