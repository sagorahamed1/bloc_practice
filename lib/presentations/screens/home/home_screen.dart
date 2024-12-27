import 'package:bloc_practice/presentations/screens/counter/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/counter_bloc/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),


      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.countertops_outlined),
            title: const Text("Counter"),
            onTap: (){


              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => CounterBloc(), // নতুন Bloc তৈরি করা হলো
                    child: const CounterScreen(),
                  ),
                ),
              );

              // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const CounterScreen()));
            },
          ),
        ],
      ),
    );
  }
}
