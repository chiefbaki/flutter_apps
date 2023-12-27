import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/model/dio_settings.dart';
import 'package:flutter_application_10/data/model/movie_model.dart';
import 'package:flutter_application_10/utils/consts/consts.dart';



class GetMovie {
  Future<dynamic> getMovie() async {
    final Dio dio = DioSettings().dio;
    try {
      final Response response = await dio
          .get("http://www.omdbapi.com/?apikey=${Consts.apiKey}&t=Spider-man&plot=full");

      if(response.statusCode == 200){
        return MovieModel.fromJson(response.data);
      }else{
        debugPrint("Error ${response.statusCode}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}