import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/product_repository.dart';
import '../../data/repositories/product_repository_impl.dart';
import 'product_remote_data_source_provider.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final remoteDataSource = ref.watch(productRemoteResourceProvider);
  return ProductRepositoryImpl(
    remoteDataSource: remoteDataSource,
  );
});
