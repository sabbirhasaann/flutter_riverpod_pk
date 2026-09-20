import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/notifier_provider.dart';

class CartSummary extends ConsumerWidget {
  const CartSummary({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Text(
      '${cart.length} products',
    );
  }
}
