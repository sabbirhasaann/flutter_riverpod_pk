import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class CounterNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void add() {
    state = state + 1;
  }
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  () {
    return CounterNotifier();
  },
);

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('initially count state is 0', () {
    final value = container.read(counterProvider);
    expect(value, 0);
  });

  test('after incrementing counter it should be 1', () {
    final value = container.read(counterProvider);
    expect(value, 0);

    container.read(counterProvider.notifier).add();
    final val = container.read(counterProvider);
    expect(val, 1);
  });
}
