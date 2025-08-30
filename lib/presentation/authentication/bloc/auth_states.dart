// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../repository/data model/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final bool? isLoadingspin;
  AuthLoading({
    this.isLoadingspin,
  });
}

class AuthAuthenticated extends AuthState {
  final UserModel? user;
  final String? message;
  AuthAuthenticated([this.user, this.message]);
}

class AuthSuccess extends AuthState {
  final String message;
  AuthSuccess(this.message);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
