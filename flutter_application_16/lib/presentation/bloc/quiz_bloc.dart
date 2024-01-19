import 'package:flutter_application_16/presentation/bloc/quiz_event.dart';
import 'package:flutter_application_16/presentation/bloc/quiz_state.dart';
import 'package:flutter_application_16/repository/quiz_repository/get_quiz_rep.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc({required this.repository}) : super(QuizInitial()) {
    on<RandomQuizEvent>((event, emit) async {
      
      try {
        emit(QuizLoading());
        List<String> answers = [];
        final question = await repository.getQuiz();
        answers.add(question.results?[0].correctAnswer ?? "");
        answers.addAll(question.results?[0].incorrectAnswers ?? []);
        // for (var element in question.results ?? []) {
        //   for (var el in element) {
        //     answers.add(el.incorrect_answers);
        //     answers.add(el.correct_answer);
        //   }
        // }
        emit(QuizSuccess(question: question, answers: answers));
      } catch (e) {
        emit(QuizError(error: e.toString()));
        print(e.toString());
      }
    });
  }
  final GetQuizRepository repository;
}
