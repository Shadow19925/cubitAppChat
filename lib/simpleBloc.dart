import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    print(transition); 
    super.onTransition(bloc, transition);
  }
}


// here instead of override onchange and onTransition  each time i will override theme here and will embadded them in the app and they will automatticaly will work each time 