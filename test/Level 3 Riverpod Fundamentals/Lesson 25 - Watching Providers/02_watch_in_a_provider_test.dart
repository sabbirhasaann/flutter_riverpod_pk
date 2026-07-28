import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final priceProvider = Provider<double>((ref) {
  return 100;
});
final taxProvider = Provider<double>((ref) {
  return 10;
});
final totalProvider = Provider<double>((ref) {
  final price = ref.watch(priceProvider);
  final tax = ref.watch(taxProvider);
  return price + tax;
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('total 110', () {
    final total = container.read(totalProvider);
    expect(total, 110);
  });

  test('prices 120 total will be 130 ', () {
    final total = container.read(totalProvider);
    expect(total, 110);

    // replace price to 120
  });
}
