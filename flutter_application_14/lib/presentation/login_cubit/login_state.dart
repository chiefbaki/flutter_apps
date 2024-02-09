import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final UserCredential user;
  LoginSuccess({required this.user});
}

final class LoginError extends LoginState {
  final String error;
  LoginError({required this.error});
}
