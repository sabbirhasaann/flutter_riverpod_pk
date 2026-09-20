import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/products_provider.dart';
import 'providers/category_provider.dart';
import 'models/category_enum.dart';

class CategoryProductPage extends ConsumerWidget {
  const CategoryProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products Page',
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(categoryProvider.notifier).state = Category.fruit;
            },
            icon: Icon(Icons.category),
          ),
        ],
      ),
      body: productAsync.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (ctx, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(product.name),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
