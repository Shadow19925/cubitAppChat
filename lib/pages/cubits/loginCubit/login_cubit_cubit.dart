import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_cubit_state.dart';

// في العادة  كل  الشاشات التي تتطلب  تحقق يعني باسورد و يوزر نيم يتم  التعامل معاها في كيوبت واحد
//  يلا هو في التتوريل  عمل  ال
// login ,  register  in one cubit but i will not do it here because the concept is clear for me
class LoginCubitCubit extends Cubit<LoginCubitState> {
  LoginCubitCubit() : super(LoginCubitInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSucces());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.code));
    } catch (ex) {
      emit(LoginFailure(ex.toString()));
    }
  }

 // @override
  //void onChange(Change<LoginCubitState> change) {
    //print(change);
    //super.onChange(change);
  // }
}
