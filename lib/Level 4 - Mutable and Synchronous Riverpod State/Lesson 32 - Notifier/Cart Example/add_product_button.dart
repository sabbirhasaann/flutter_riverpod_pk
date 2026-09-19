import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/product.dart';
import 'providers/cart_provider.dart';

class AddProductButton extends ConsumerWidget {
  final Product product;
  const AddProductButton({
    super.key,
    required this.product,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.read(cartNotifierProvider.notifier).addProduct(product);
        Navigator.of(context).pop();
      },
      child: Icon(
        Icons.add,
      ),
    );
  }
}
