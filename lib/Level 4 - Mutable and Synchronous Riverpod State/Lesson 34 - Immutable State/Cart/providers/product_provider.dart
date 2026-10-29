import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class ProductNotifier extends Notifier<List<Product>> {
  static int id = 0;

  @override
  List<Product> build() {
    return [];
  }

  void addProduct() {
    final product = Product(
      id: id,
      name: 'Product $id',
    );

    id += 1;
    state = [...state, product];
  }
}

final productNotifierProvider =
    NotifierProvider<ProductNotifier, List<Product>>(
      ProductNotifier.new,
    );
