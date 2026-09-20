import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});
