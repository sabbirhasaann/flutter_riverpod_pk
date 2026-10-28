import '../../domain/entities/product.dart';

class ProductState {
  List<Product> products;
  bool isLoading;
  ProductState({
    required this.products,
    this.isLoading = false,
  });
}
