part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginSucces extends AuthState {}

class LoginFailure extends AuthState {
  LoginFailure(this.errorMessage);
  String errorMessage;
}

class LoginLoading extends AuthState {}

class RegisterSucces extends AuthState {}

class RegisterFailure extends AuthState {
  RegisterFailure(this.errorMessage);
  String errorMessage;
}

class RegisterLoading extends AuthState {}
