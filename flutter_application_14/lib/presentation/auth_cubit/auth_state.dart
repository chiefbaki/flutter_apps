import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserCredential user;
  AuthSuccess({required this.user});
}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}
