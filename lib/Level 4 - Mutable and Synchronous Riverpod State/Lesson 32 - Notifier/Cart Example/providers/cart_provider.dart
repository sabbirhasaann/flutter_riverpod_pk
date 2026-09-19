import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class CartNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    final alreadyExists = state.any((item) {
      return item.id == product.id;
    });

    if (alreadyExists) {
      return;
    }

    state = [...state, product];
  }

  void removeProduct(int productId) {
    state = state.where((product) {
      return product.id != productId;
    }).toList();
  }

  void clearCart() {
    state = [];
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, List<Product>>(
  CartNotifier.new,
);
