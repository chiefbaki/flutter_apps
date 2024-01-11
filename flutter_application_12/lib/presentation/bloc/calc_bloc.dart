import 'package:flutter_application_12/presentation/bloc/calc_event.dart';
import 'package:flutter_application_12/presentation/bloc/calc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  CalcBloc() : super(CalcInitial()) {
    on<AdditionEvent>(
      (event, emit) async {
        emit(CalcLoading());
        print("Loading");
        await Future.delayed(const Duration(seconds: 1));
        try {
          double result = double.parse(event.a) + double.parse(event.b);
          emit(CalcSuccess(result: result));
          print("Success");
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
        double result = double.parse(event.a) - double.parse(event.b); 
        emit(CalcSuccess(result: result));
      } catch (e) {
        emit(CalcError(errorText: e.toString()));
      }
    });
  }
}
