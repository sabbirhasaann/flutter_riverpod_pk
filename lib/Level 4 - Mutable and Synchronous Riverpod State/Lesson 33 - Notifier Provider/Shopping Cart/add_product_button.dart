import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/notifier_provider.dart';
import 'models/product.dart';

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
        ref.read(cartProvider.notifier).addProduct(product);
      },
      child: const Text('Add to Cart'),
    );
  }
}
