import 'package:flutter_application_17/data/model/quiz_model.dart';

abstract class QuizState {}

class QuizInitialState extends QuizState {}

class QuizLoadingState extends QuizState {}

class QuizSuccessState extends QuizState {
  final QuizModel quiz;
  QuizSuccessState({required this.quiz});
}

class QuizErrorState extends QuizState {
  final String error;
  QuizErrorState({required this.error});
}
