import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(LoginSucces());
        } on FirebaseAuthException catch (e) {
          emit(LoginFailure(e.code));
        } catch (ex) {
          emit(LoginFailure(ex.toString()));
        }
      }
    });
  }
 // @override
  //void onTransition(Transition<AuthEvent, AuthState> transition) {
    //  this method only exist on the bloc in genral it's observe the event and the state
    //print(transition);
    //super.onTransition(transition);
  //}
}

//the steps  to   create bloc
//1-  create the event
// 2-  create the state
//3-  create the bloc

// the app may contain or use bloc and cubit at the same time
