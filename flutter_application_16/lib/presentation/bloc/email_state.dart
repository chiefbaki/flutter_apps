abstract class EmailState{}

class EmailStateInitial extends EmailState{}

class EmailStateLoading extends EmailState{}

class EmailStateSuccess extends EmailState{}

class EmailStateError extends EmailState{
  final String error;
  EmailStateError({required this.error});
}