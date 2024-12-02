import 'dart:math';

import 'package:bloc_practice/bloc/counter_bloc/counter_bloc.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text("Counter "),),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Stack(
            children: [
              for(int index = 0; index <state.count; index ++)
                Positioned(
                  left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(400).toDouble(),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green
                      ),
                    )
                )
            ],
          );
        },),
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(onPressed: (){
            counterBloc.add(CounterIncrementPressed());
          }, child: const Icon(Icons.add)),


          FloatingActionButton(onPressed: (){
            counterBloc.add(CounterDecrementPressed());
          }, child: const Icon(Icons.remove)),


          FloatingActionButton(onPressed: (){
            counterBloc.add(CounterZero());
          }, child: const Icon(Icons.exposure_zero)),
        ],
      ),
    );
  }
}
