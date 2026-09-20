import 'package:flutter_riverpod/flutter_riverpod.dart';
import './products_provider.dart';
import '../models/product.dart';

final productProvider = Provider.family<Product?, int>((ref, id) {
  final products = ref.watch(productsProvider);

  for (final product in products) {
    if (product.id == id) return product;
  }
  return null;
});
