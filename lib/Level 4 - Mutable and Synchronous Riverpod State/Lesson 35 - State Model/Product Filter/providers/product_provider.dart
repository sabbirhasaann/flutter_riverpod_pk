import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import './products_provider.dart';

final productProvider = Provider.family<Product?, String>((ref, id) {
  final products = ref.watch(productsProvider);

  for (final product in products) {
    if (product.id == id) return product;
  }
  return null;
});
