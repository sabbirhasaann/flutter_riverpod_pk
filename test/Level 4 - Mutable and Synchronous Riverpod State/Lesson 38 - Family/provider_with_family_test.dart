import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod_pk/Level 4 - Mutable and Synchronous Riverpod State/Lesson 38 - Family/providers/product_selection_provider.dart';

void main() {
  late final ProviderContainer container;
  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('product Id should be 10 printed', () {
    var selection = container.read(productSelectionProvider(10));
    expect(selection, 0);
    container.read(productSelectionProvider(10).notifier).increment();
    selection = container.read(productSelectionProvider(10));
    expect(selection, 1);
  });
}
