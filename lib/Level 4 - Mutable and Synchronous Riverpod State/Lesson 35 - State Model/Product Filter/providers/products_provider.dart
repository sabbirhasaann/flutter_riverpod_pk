import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/dummy_data.dart';
import '../models/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return ProductData.dummyProducts;
});
