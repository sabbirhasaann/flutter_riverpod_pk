import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../providers/product_repository_provider.dart';

final getProductsUsecaseProvider = Provider<GetProductsUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUsecase(
    repository: repository,
  );
});
