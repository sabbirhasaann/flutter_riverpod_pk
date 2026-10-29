import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/product_provider.dart';
import 'providers/cart_provider.dart';
import './cart_page.dart';

class CartImmutableStatePage extends ConsumerWidget {
  const CartImmutableStatePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    final productCount = ref.watch(productCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart Immutable State Page',
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CartPage();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.shopping_cart,
                ),
              ),
              Text(
                '$productCount',
              ),
            ],
          ),
        ],
        actionsPadding: EdgeInsets.only(
          right: 16,
        ),
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ListTile(
            title: Text(
              '${product.id}',
            ),

            subtitle: Text(
              product.name,
            ),

            trailing: ElevatedButton(
              onPressed: () {
                ref.read(cartNotifierProvider.notifier).addProduct(product);
              },
              child: Text('Add to cart'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(productNotifierProvider.notifier).addProduct();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
