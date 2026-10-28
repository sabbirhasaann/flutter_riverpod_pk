import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/products/domain/usecases/get_products_usecase.dart';
import 'package:flutter_riverpod_pk/features/products/presentation/providers/get_products_usecae_provider.dart';
import './product_state.dart';

class ProductNotifier extends Notifier<ProductState> {
  late final GetProductsUsecase _getProducts;

  @override
  ProductState build() {
    _getProducts = ref.watch(getProductsUsecaseProvider);
    Future.microtask(() => getProducts());
    return ProductState(
      products: [],
      isLoading: true,
    );
  }

  Future<void> getProducts() async {
    try {
      state = ProductState(
        products: [],
        isLoading: true,
      );

      final products = await _getProducts();

      state = ProductState(
        products: products,
        isLoading: false,
      );
    } catch (e) {
      print("Catch ... $e",);
      state = ProductState(
        products: [],
      );
    }
  }
}
