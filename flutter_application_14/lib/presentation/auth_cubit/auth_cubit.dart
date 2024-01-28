import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_14/firebase_services/firebase_service.dart';
import 'package:flutter_application_14/presentation/auth_cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.repository}) : super(AuthInitial());

  Future<void> createAccount(
      {required String email, required String password}) async {
    emit(AuthLoading());
    try {
      UserCredential user =
          await repository.createAccount(email: email, password: password);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }

  final FireBaseServices repository;
}
