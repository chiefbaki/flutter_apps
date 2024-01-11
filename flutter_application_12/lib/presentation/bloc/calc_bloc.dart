import 'package:flutter_application_12/presentation/bloc/calc_event.dart';
import 'package:flutter_application_12/presentation/bloc/calc_state.dart';
import 'package:flutter_application_12/repository/calc_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  final CalcRepository repository;
  CalcBloc({required this.repository}) : super(CalcInitial()) {
    on<AdditionEvent>(
      (event, emit) async {
        emit(CalcLoading());
        await Future.delayed(const Duration(seconds: 1));
        try {
          double result = repository.sum(a: event.a, b: event.b);
          emit(CalcSuccess(result: result));
        } catch (e) {
          CalcError(errorText: e.toString());
          print(e.toString());
        }
      },
    );

    on<SubstractionEvent>((event, emit) async{
      emit(CalcLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        double result = repository.differences(a: event.a, b: event.b);
        emit(CalcSuccess(result: result));
      } catch (e) {
        emit(CalcError(errorText: e.toString()));
        print(e.toString());
      }
    });
  }
}
