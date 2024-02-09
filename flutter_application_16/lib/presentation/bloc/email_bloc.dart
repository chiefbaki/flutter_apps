import 'package:flutter_application_16/domain/repository/email_repository.dart';
import 'package:flutter_application_16/presentation/bloc/email_event.dart';
import 'package:flutter_application_16/presentation/bloc/email_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc({required this.repository}) : super(EmailStateInitial()) {
    on<EmailSendMessageEvent>((event, emit) {
      emit(EmailStateLoading());
      try {
        repository.sendMessage(name: event.fromName, message: event.message);
        emit(EmailStateSuccess());
      } catch (e) {
        emit(EmailStateError(error: e.toString())); 
      }
    });
  }
  final EmailRepository repository;
}