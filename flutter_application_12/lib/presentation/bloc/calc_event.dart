abstract class CalcEvent{}

class AdditionEvent extends CalcEvent{
  final String a;
  final String b;
  AdditionEvent({required this.a, required this.b});
}

class SubstractionEvent extends CalcEvent{
  final String a;
  final String b;
  SubstractionEvent({required this.a, required this.b});
}