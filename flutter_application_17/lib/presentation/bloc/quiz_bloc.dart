import 'package:flutter_application_17/data/model/quiz_model.dart';
import 'package:flutter_application_17/domain/repository/quiz_repository.dart';
import 'package:flutter_application_17/presentation/bloc/quiz_event.dart';
import 'package:flutter_application_17/presentation/bloc/quiz_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required this.repository}) : super(QuizInitialState()) {
    on<GetQuizEvent>((event, emit) async {
      emit(QuizLoadingState());
      try {
        final QuizModel model = await repository.getQuiz();
        emit(QuizSuccessState(quiz: model));
      } catch (e) {
        emit(QuizErrorState(error: e.toString()));
      }
    });
  }
  final QuizRepository repository;
}
