import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/cubits/RegisterCubit/register_cubit_cubit.dart';
import 'package:scholar_chat/pages/cubits/cubit/Auth_Bloc/auth_bloc.dart';
import 'package:scholar_chat/pages/cubits/cubit/chat_cubit_cubit.dart';
import 'package:scholar_chat/pages/cubits/loginCubit/login_cubit_cubit.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/resgister_page.dart';
import 'package:scholar_chat/simpleBloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(() => runApp(const ScholarChat()), 
   // here i will embaded the the observer class that i create and from here 
   //it will obsearve the app and print in the terminal any data related to 
   //bloc or the cubit used in the app 

   // note  :  the runZoned will be deprecated soon  
      blocObserver: SimpleBlocObserver());
 
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      //BlocProvider(create: (context) => LoginCubitCubit(),) in case of
      // using only  one bloc provider  till now a i used the 1-  BlocListener 2- BlocConsumer 2- BlocBulider
      // in cuse if want to use  i must use it like this multiProvider MultiBlocProvider(provider:[context) => LoginCubitCubit(),context) => LoginCubitCubit()] )
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => LoginCubitCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubitCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubitCubit(),
        )
      ],

      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
