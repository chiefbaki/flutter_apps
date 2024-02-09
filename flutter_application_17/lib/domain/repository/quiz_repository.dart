import 'package:dio/dio.dart';
import 'package:flutter_application_17/data/model/quiz_model.dart';

class QuizRepository {
  final Dio dio;
  QuizRepository({required this.dio});
  Future<QuizModel> getQuiz() async {
    final Response response = await dio.get("");
    return QuizModel.fromJson(response.data);
  }
}
