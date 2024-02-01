import 'package:flutter/material.dart';
import 'package:flutter_application_15/data/model/movie_model.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final MovieModel result;
  SearchSuccess({required this.result});
}

final class SearchError extends SearchState {
  final String error;
  SearchError({required this.error});
}
