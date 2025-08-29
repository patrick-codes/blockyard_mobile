// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSucces extends AuthState {
  final String message;
  final UserModel userModel;

  AuthSucces({
    required this.message,
    required this.userModel,
  });
}

class AuthAuthenticated extends AuthState {
  final UserModel userModel;

  AuthAuthenticated({required this.userModel});
}

class AuthUnauthenticated extends AuthState {}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

final class AuthLoading extends AuthState {
  final bool isLoading;

  AuthLoading({required this.isLoading});
}

final class AuthLogoutSucces extends AuthState {
  final String message;

  AuthLogoutSucces({required this.message});
}
