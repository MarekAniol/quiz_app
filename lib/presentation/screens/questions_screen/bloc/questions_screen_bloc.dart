import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/domain/models/questions_list_model.dart';
import 'package:quiz_app/domain/service/questions_list_service.dart';

part 'questions_screen_state.dart';
part 'questions_screen_event.dart';
part 'questions_screen_bloc.freezed.dart';

class QuestionsScreenBloc extends Bloc<QuestionsScreenEvent, QuestionsScreenState> {
  QuestionsScreenBloc({
    required QuestionsListService questionsListService,
  })  : _questionsListService = questionsListService,
        super(QuestionsScreenState.initial()) {
    on<QuestionsScreenEvent>(
      onEachEvent,
      transformer: sequential(),
    );
  }

  final QuestionsListService _questionsListService;

  Future<void> onEachEvent(
    QuestionsScreenEvent event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    await event.map(
      started: (value) => _mapStarted(value, emit),
      questionReaded: (value) => _mapQuestionReaded(value, emit),
    );
  }

  Future<void> _mapStarted(
    _QuestionsScreenStarted event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    add(
      const QuestionsScreenEvent.questionReaded(),
    );
  }

  Future<void> _mapQuestionReaded(
    _QuestionsReaded event,
    Emitter<QuestionsScreenState> emit,
  ) async {
    final questionsListModel = await _questionsListService.getQuestionList();
    emit(
      state.copyWith(
        questionsList: questionsListModel,
      ),
    );
  }
}
