part of 'login_cubit_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class LoginSucces extends LoginCubitState {}

class LoginFailure extends LoginCubitState {
  LoginFailure(this.errorMessage);
  String errorMessage;
}

class LoginLoading extends LoginCubitState {}
