import 'package:flutter/services.dart';
import 'package:quiz_app/locale/models/questions_list_local_model.dart';
import 'dart:convert';

abstract class QuestionsFakeApi {
  Future<QuestionsListLocalModel> getQuestionList();
}

class QuestionsFakeApiImpl implements QuestionsFakeApi {
  QuestionsFakeApiImpl({
    required this.filePath,
  });

  final String filePath;
  @override
  Future<QuestionsListLocalModel> getQuestionList() async {
    final jsonString = await rootBundle.loadString('assets/questions.json');
    final jsonMap = jsonDecode(jsonString);

    final QuestionsListLocalModel questionsListLocalModel =
        QuestionsListLocalModel.fromJson(jsonMap);
    return questionsListLocalModel;
  }
}
