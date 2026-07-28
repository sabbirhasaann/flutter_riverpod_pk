import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String name;
  String? category;
  Product({
    required this.name,
    this.category,
  });
}

// source
final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(name: "p1", category: "fruit"),
    Product(name: "p2", category: "fruit"),
    Product(name: "p3", category: "fish"),
  ];
});

final selectedCategoryProvider = Provider<String>((ref) {
  return "fruit";
});

final searchQueryProvider = Provider<String>((ref) {
  return "p1";
});

// derived state
final filteredProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(productsProvider);
  final category = ref.watch(selectedCategoryProvider);
  final searchQuery = ref.watch(searchQueryProvider);

  return products.where((product) {
    final matchesCategory = category == null || product.category == category;
    final matchesSearch = product.name.toLowerCase().contains(
      searchQuery.toLowerCase(),
    );
    return matchesCategory && matchesSearch;
  }).toList();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: ProductList(),
      ),
    );
  }
}

class ProductList extends ConsumerWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(filteredProductsProvider);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
        );
      },
    );
  }
}

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('products count is 1', () {
    final products = container.read(filteredProductsProvider);
    expect(products.length, 1);
  });
}
