import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:scholar_chat/models/message.dart';

import '../../../constants.dart';

part 'chat_cubit_state.dart';

class ChatCubitCubit extends Cubit<ChatCubitState> {
  ChatCubitCubit() : super(ChatCubitInitial());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);

  void sendMessage({required String message, required String email}) {
    try {
      messages
          .add({kMessage: message, kCreatedAt: DateTime.now(), "id": email});
    } catch (e) {
      print(e.toString());
    }
  }

  void getMessage() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      List<Message> messagesList = [];
      try {
        print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${event.docs}");
        for (var doc in event.docs) {
          print(".............................. ${doc}");
          messagesList.add(Message.fromJson(doc));
        }
        print("success");
        emit(ChatSuccess(messages: messagesList));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
