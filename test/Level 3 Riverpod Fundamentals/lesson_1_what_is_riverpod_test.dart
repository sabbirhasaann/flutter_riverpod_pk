import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final greetingProvider = Provider<String>((ref) {
  return 'Hello';
});

void main() {
  test('greetingProvider returns "Hello"', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final greeting = container.read(greetingProvider);
    expect(greeting, "Hello");
  });

  test('greetingProvider can be overridden', () {
    final container = ProviderContainer(
      overrides: [
        greetingProvider.overrideWithValue('Hello, World!'),
      ],
    );
    addTearDown(container.dispose);

    expect(container.read(greetingProvider), 'Hello, World!');
  });

  testWidgets('Widget displays greeting from provider', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: Consumer(
            builder: (context, ref, child) {
              final greeting = ref.watch(greetingProvider);
              return Text(greeting);
            },
          ),
        ),
      ),
    );

    expect(find.text('Hello'), findsOneWidget);
  });
}
