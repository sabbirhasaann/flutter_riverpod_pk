import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: ProductPage(),
      ),
    );
  }
}

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef) {
    return Text('Product Page');
  }
}

void main() {
  testWidgets('Tester product page', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(),
    );

    expect(
      find.text('Product Page'),
      findsOneWidget,
    );
  });
}
