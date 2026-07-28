import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String name;
  Product({required this.name});
}

final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(name: "name1"),
    Product(name: "name2"),
  ];
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
    final products = ref.watch(productsProvider);
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Text(products[index].name);
      },
    );
  }
}
