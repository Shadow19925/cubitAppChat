part of 'register_cubit_cubit.dart';

@immutable
abstract class RegisterCubitState {}

class RegisterCubitInitial extends RegisterCubitState {}

class RegisterSucces extends RegisterCubitState {}

class RegisterFailure extends RegisterCubitState {
  RegisterFailure(this.errorMessage);
  String errorMessage;
}

class RegisterLoading extends RegisterCubitState {}
