import 'package:bloc_practice/presentations/screens/counter/counter_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),


      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.countertops_outlined),
            title: const Text("Counter"),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CounterScreen()));
            },
          ),
        ],
      ),
    );
  }
}
