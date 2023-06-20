import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/core/extensions/state_type_extension.dart';
import 'package:quiz_app/domain/models/answer_model.dart';
import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/domain/models/quiz_question_model.dart';
import 'package:quiz_app/domain/service/quiz_service.dart';

part 'questions_screen_state.dart';
part 'questions_screen_event.dart';
part 'questions_screen_bloc.freezed.dart';

class QuestionsScreenBloc extends Bloc<QuestionsScreenEvent, QuestionsScreenState> {
  QuestionsScreenBloc({
    required QuizService quizListService,
  })  : _quizListService = quizListService,
        super(QuestionsScreenState.initial()) {
    on<QuestionsScreenEvent>(
      onEachEvent,
      transformer: sequential(),
    );
  }

  final QuizService _quizListService;

  Future<void> onEachEvent(
    QuestionsScreenEvent event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    await event.map(
        questionsScreenStarted: (value) => _mapQuestionsScreenStarted(value, emit),
        questionReaded: (value) => _mapQuestionReaded(value, emit),
        questionAnswered: (value) => _mapQuestionAnswered(value, emit));
  }

  Future<void> _mapQuestionsScreenStarted(
    _QuestionsScreenStarted event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    if (state.type == StateType.loading) {
      add(const QuestionsScreenEvent.questionReaded());
    }
  }

  Future<void> _mapQuestionReaded(
    _QuestionsReaded event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    final questionsListModel = await _quizListService.getQuestionList();

    emit(
      state.copyWith(
        questionsListModel: questionsListModel,
        type: StateType.loaded,
      ),
    );
  }

  Future<void> _mapQuestionAnswered(
    _QuestionAnswered event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    if (state.isNotLastQuestion) {
      final answerModel = AnswerModel(
        question: state.currentQuestionText,
        answer: event.answer,
        isAnswerCorrect: event.answer == state.corectAnswer,
      );
      List<AnswerModel> listOfAnswers = [...state.answers];
      listOfAnswers.add(answerModel);

      emit(
        state.copyWith(
          answers: listOfAnswers,
        ),
      );

      final currentQuestionIndex = state.currentQuestionIndex + 1;

      emit(
        state.copyWith(
          currentQuestionIndex: currentQuestionIndex,
        ),
      );
    } else {
      final currentQuestionIndex = state.questionsListModel.questions.length;
      emit(
        state.copyWith(
          type: StateType.loading,
          currentQuestionIndex: currentQuestionIndex,
        ),
      );

      final AnswersListModel answersListModel = AnswersListModel(
        answers: state.answers,
      );

      await _quizListService.saveAnswersToFile(
        answersListModel: answersListModel,
      );
    }
  }
}
