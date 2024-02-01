import 'package:dio/dio.dart';
import 'package:flutter_application_15/core/consts/consts.dart';
import 'package:flutter_application_15/data/model/movie_model.dart';

class SearchRepository {
  final Dio _dio;
  SearchRepository(this._dio);

  Future<MovieModel> search({required String name, required String year}) async {
    final Response response = await _dio.get("", queryParameters: {
      "apikey": AppConsts.key,
      "t": name,
      "y": year,
      "plot": "short"
    });
    return MovieModel.fromJson(response.data);
  }
}
