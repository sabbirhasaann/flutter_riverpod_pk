import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return 'John';
});

final firstNameProvider = Provider<String>((ref) {
  return 'John';
});

final greetingProvider = Provider<String>((ref) {
  final name = ref.watch(firstNameProvider);
  return "Hello, $name";
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('greating will be Hello, John', () {
    final greet = container.read(greetingProvider);
    expect(greet, 'Hello, John');
  });
}
