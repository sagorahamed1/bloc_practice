import 'package:bloc_practice/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/presentations/screens/counter/counter_screen.dart';
import 'package:bloc_practice/presentations/screens/home/home_screen.dart';
import 'package:bloc_practice/presentations/screens/log_in/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc practice',
      home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LoginBloc())
          ],
          child:  LoginScreen())
    );
  }
}
