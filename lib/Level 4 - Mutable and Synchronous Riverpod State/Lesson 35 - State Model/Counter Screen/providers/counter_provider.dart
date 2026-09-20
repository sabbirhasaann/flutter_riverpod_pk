import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/counter_state.dart';

class CounterNotifier extends Notifier<CounterState> {
  @override
  CounterState build() {
    return CounterState(
      value: 0,
    );
  }

  void increment() {
    state = state.copyWith(
      value: state.value + 1,
    );
  }

  void decrement() {
    state = state.copyWith(
      value: state.value - 1,
    );
  }
}

final counterProvider = NotifierProvider<CounterNotifier, CounterState>(
  CounterNotifier.new,
);
