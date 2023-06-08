import 'package:quiz_app/locale/models/questions_list_local_model.dart';
import 'dart:io';
import 'dart:convert';

abstract class QuestionsFakeApi {
  Future<QuestionsListLocalModel> getQuestionList();
}

class QuestionsFakeApiImpl implements QuestionsFakeApi {
  @override
  Future<QuestionsListLocalModel> getQuestionList() async {
    final jsonString = await File('lib/locale/questions.json').readAsString();
    final jsonMap = jsonDecode(jsonString);

    final QuestionsListLocalModel questionsListLocalModel =
        QuestionsListLocalModel.fromJson(jsonMap);
    return questionsListLocalModel;
  }
}
