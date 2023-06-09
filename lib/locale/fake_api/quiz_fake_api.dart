import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/locale/models/answers_list_local_model.dart';
import 'package:quiz_app/locale/models/questions_list_local_model.dart';
import 'dart:convert';

abstract class QuizFakeApi {
  Future<QuestionsListLocalModel> getQuestionList();
  Future<void> saveAnswersToFile(
    AnswersListModel answersListModel,
  );
}

class QuizFakeApiImpl implements QuizFakeApi {
  QuizFakeApiImpl({
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

  @override
  Future<void> saveAnswersToFile(AnswersListModel answersListModel) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/answers.json');
    final answers = answersListModel.toLocale();
    final jsonString = jsonEncode(answers.toJson());

    await file.writeAsString(jsonString);
  }
}
