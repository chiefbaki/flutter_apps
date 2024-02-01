import 'package:flutter_application_15/cubit/search_cubit/search_state.dart';
import 'package:flutter_application_15/data/model/movie_model.dart';
import 'package:flutter_application_15/repositories/search_repository/search_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.repository}) : super(SearchInitial());

  Future<void> searchMovie({required String name, required String year}) async {
    emit(SearchLoading());
    try {
      final MovieModel result = await repository.search(name: name, year: year);
      emit(SearchSuccess(result: result));
    } catch (e) {
      emit(SearchError(error: e.toString()));
    }
  }

  final SearchRepository repository;
}
