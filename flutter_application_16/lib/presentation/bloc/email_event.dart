abstract class EmailEvent{}

class EmailSendMessageEvent extends EmailEvent{
  final String fromName;
  final String message;
  EmailSendMessageEvent({required this.fromName, required this.message});
}
