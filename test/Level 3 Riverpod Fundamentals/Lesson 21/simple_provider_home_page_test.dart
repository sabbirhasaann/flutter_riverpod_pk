import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppString {
  static const String appName = 'My Shop';
}

final appNameProvider = Provider<String>((ref) {
  return AppString.appName;
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);
    debugPrint(ref.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Text(appName),
      ),
    );
  }
}

void main() {
  testWidgets('App Name should be displayed in more than one widget', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MyApp(),
    );

    expect(find.text(AppString.appName), findsExactly(2));
  });
}
