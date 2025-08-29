// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AppStartedEvent extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String phonenumber;
  final String fullName;

  LoginEvent({required this.phonenumber, required this.fullName});
}

class OTPEvent extends AuthEvent {
  final String pin;

  OTPEvent({required this.pin});
}

class SignupEvent extends AuthEvent {
  final String name;
  final String phone;
  final String email;
  final String password;
  SignupEvent({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
}

class CodeSentEvent extends AuthEvent {
  final String phone;
  final String verificationId;

  CodeSentEvent({
    required this.phone,
    required this.verificationId,
  });
}

class LoginSuccessful extends AuthEvent {
  final String jwtToken;
  final UserModel userModel;

  LoginSuccessful({required this.jwtToken, required this.userModel});
}

class LogoutEvent extends AuthEvent {}
