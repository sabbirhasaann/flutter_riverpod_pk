import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final productsProvider = Provider.autoDispose<List<Product>>((ref) {
  ref.onDispose(() {
    print("Products provider disposed");
  });

  return [
    Product(id: 42),
    Product(id: 41),
  ];
});
