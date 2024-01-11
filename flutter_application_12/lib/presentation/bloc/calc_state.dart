abstract class CalcState{}

class CalcInitial extends CalcState{ }

class CalcSuccess extends CalcState{
  final double result;
  CalcSuccess({required this.result});
}

class CalcLoading extends CalcState{}

class CalcError extends CalcState{
  final String errorText;
  CalcError({required this.errorText});
}