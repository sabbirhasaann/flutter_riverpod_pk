import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final int id;
  final String name;
  Product({
    required this.id,
    required this.name,
  });
}

final productProvider = Provider.autoDispose.family<Product, int>((
  ref,
  productId,
) {
  return Product(
    id: productId,
    name: 'Product $productId',
  );
});
