part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;

  LoginEvent(this.email, this.password);
}

class RegisterEvent extends AuthEvent {}
