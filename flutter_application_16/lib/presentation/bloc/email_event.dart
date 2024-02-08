abstract class EmailEvent{}

class EmailSendMessageEvent extends EmailEvent{
  final String fromName;
  final String toName;
  final String message;
  EmailSendMessageEvent({required this.fromName, required this.toName, required this.message});
}
