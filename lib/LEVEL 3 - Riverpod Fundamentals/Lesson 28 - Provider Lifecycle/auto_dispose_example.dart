import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/products_provider.dart';

class AutoDisposeExample extends ConsumerWidget {
  const AutoDisposeExample({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productsProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) {
          final product = products[index];
          return ListTile(
            title: Text(
              product.id.toString(),
            ),
          );
        },
      ),
    );
  }
}
