import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_app/core/extensions/state_type_extension.dart';
import 'package:quiz_app/domain/models/answers_list_model.dart';
import 'package:quiz_app/domain/service/quiz_service.dart';

part 'summary_screen_state.dart';
part 'summary_screen_event.dart';
part 'summary_screen_bloc.freezed.dart';

class SummaryScreenBloc extends Bloc<SummaryScreenEvent, SummaryScreenState> {
  SummaryScreenBloc({
    required QuizService quizListService,
  })  : _quizListService = quizListService,
        super(SummaryScreenState.initial()) {
    on<SummaryScreenEvent>(
      onEachEvent,
      transformer: sequential(),
    );
  }

  final QuizService _quizListService;

  Future<void> onEachEvent(
    SummaryScreenEvent event,
    Emitter<SummaryScreenState> emit,
  ) async {
    await event.map(
      summaryScreenStarted: (value) => _mapSummaryScreenStarted(value, emit),
    );
  }

  Future<void> _mapSummaryScreenStarted(
    _SummaryScreenStarted event,
    Emitter<SummaryScreenState> emit,
  ) async {
    emit(
      state.copyWith(
        stateType: StateType.loaded,
      ),
    );

    if (state.stateType == StateType.loaded) {
      final answersListModel = await _quizListService.getAnswersSummary();
      emit(
        state.copyWith(
          answersListModel: answersListModel,
        ),
      );
    }
  }
}
