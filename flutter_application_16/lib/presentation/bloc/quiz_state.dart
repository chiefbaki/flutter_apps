import 'package:flutter_application_16/data/model/quiz_model.dart';

abstract class QuizState{}


class QuizInitial extends QuizState{}

class QuizLoading extends QuizState{}

class QuizSuccess extends QuizState{
  final QuizModel question;
  final List<String> answers;
  QuizSuccess({required this.question, required this.answers});
}

class QuizError extends QuizState{
  final String error;
  QuizError({required this.error});
}
