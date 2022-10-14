import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  RegisterCubitCubit() : super(RegisterCubitInitial());

  Future<void> RegisterUser(
      {required String email, required String password}) async {
    emit(RegisterCubitInitial());
    try {
        emit(RegisterLoading());
      UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    emit(RegisterSucces());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure(e.code));
    } catch (ex) {
      emit(RegisterFailure(ex.toString()));
    }
  }
}

