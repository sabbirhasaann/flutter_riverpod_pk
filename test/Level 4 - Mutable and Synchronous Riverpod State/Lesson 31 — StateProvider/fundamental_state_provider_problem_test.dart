import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: ProductFilterPage(),
      ),
    );
  }
}

enum ProductFilter {
  all,
  available,
  unavailable,
}

enum SortOption {
  priceAscending,
  priceDescending,
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  SortOption sort = SortOption.priceAscending;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<SortOption>(
      value: sort,
      onChanged: (value) {
        setState(() {
          sort = value!;
        });
      },
      items: const [
        DropdownMenuItem(
          value: SortOption.priceAscending,
          child: Text('Price: Low → High'),
        ),
        DropdownMenuItem(
          value: SortOption.priceDescending,
          child: Text('Price: High → Low'),
        ),
      ],
    );
  }
}

final productFilterProvider = StateProvider<ProductFilter>((ref) {
  print("Provider created...");
  ref.onDispose(() {
    print("Destroying provider...");
  });
  return ProductFilter.all;
});

class ProductFilterPage extends ConsumerWidget {
  const ProductFilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(productFilterProvider);
    print(filter.name);
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Selected: ${filter.name}',
          ),

          DropdownButton<ProductFilter>(
            key: const Key('drop-down'),
            value: filter,
            onChanged: (value) {
              if (value == null) return;

              ref.read(productFilterProvider.notifier).state = value;
            },
            items: ProductFilter.values
                .map(
                  (filter) => DropdownMenuItem(
                    value: filter,
                    child: Text(filter.name),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

void main() {
  testWidgets('product filter page', (WidgetTester tester) async {
    await tester.pumpWidget(
      MyApp(),
    );

    expect(
      find.text('Selected: all'),
      findsOneWidget,
    );
  });

  testWidgets('filter should change on tap', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final dropDown = find.byKey(
      const Key('drop-down'),
    );

    final avaibleMenu = find.text('available');

    await tester.tap(dropDown);

    await tester.pumpAndSettle();

    await tester.tap(avaibleMenu);
    await tester.pumpAndSettle();

    expect(
      find.text('Selected: available'),
      findsOneWidget,
    );
  });
}
