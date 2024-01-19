import 'package:dio/dio.dart';
import 'package:flutter_application_16/data/model/quiz_model.dart';
import 'package:flutter_application_16/data/network/network_settings.dart';

class GetQuizRepository {
  final Dio _dio = DioSettings().dio;

  Future<QuizModel> getQuiz() async {
    final Response response =
        await _dio.get("https://opentdb.com/api.php?amount=10");
    return QuizModel.fromJson(response.data);
  }
}
