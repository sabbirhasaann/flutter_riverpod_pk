class CounterState {
  final int value;
  CounterState({
    required this.value,
  });

  CounterState copyWith({
    int? value,
  }) {
    return CounterState(
      value: value ?? this.value,
    );
  }
}
