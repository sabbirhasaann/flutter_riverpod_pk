import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class CartNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    if (state.any((p) => p.id == product.id)) {
      return;
    }
    state = [...state, product];
  }

  void removeProduct(String id) {
    state = [
      for (final product in state)
        if (product.id != id) product,
    ];
  }

  void clearCart() {
    state = [];
  }
}

final cartProvider = NotifierProvider<CartNotifier, List<Product>>(
  CartNotifier.new,
);
