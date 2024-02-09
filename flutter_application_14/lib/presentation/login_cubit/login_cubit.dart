import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_14/firebase_services/firebase_service.dart';
import 'package:flutter_application_14/presentation/login_cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(LoginInitial());

  Future<void> makeLogin(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      final UserCredential user =
          await repository.login(email: email, password: password);
      emit(LoginSuccess(user: user));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(LoginError(error: e.toString()));
      } else {
        debugPrint(e.toString());
      }
    }
  }

  final FireBaseServices repository;
}
