part of 'chat_cubit_cubit.dart';

@immutable
abstract class ChatCubitState {}

class ChatCubitInitial extends ChatCubitState {}

class ChatSuccess extends ChatCubitState {

  ChatSuccess({required this.messages});
  List<Message> messages = [];
}
