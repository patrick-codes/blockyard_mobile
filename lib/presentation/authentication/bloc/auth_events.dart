abstract class AuthEvent {}

class AppStartedEvent extends AuthEvent {}

class RegisterUserEvent extends AuthEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  RegisterUserEvent(this.name, this.phone, this.email, this.password);
}

class LoginUserEvent extends AuthEvent {
  final String email;
  final String password;

  LoginUserEvent(this.email, this.password);
}

class LogoutProfile extends AuthEvent {}

class LoginProfile extends AuthEvent {
  final String token;
  LoginProfile(this.token);
}
