import 'package:bloc_practice/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_practice/bloc/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterState(0)){
    on<CounterIncrementPressed>((event, emit){
      emit(CounterState(state.count +1));
    });

    on<CounterDecrementPressed>((event, emit){
      emit(CounterState(state.count - 1));
    });
    
    
    on<CounterZero>((state, emit){
      emit(CounterState(0));
    });


    on<Counter100>((state, emit){
      emit(CounterState(100));
    });
  }
}