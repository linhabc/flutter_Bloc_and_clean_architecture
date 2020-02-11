part of 'counter_bloc.dart';

class CounterState {
  int counter;

  CounterState(this.counter);

  factory CounterState.initial() {
    return CounterState(0);
  }
}
