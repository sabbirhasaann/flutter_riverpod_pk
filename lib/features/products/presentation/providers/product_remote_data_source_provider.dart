import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/api_client_provider.dart';
import '../../data/datasources/product_remote_data_source.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/secure_token_storage_provider.dart';

final productRemoteResourceProvider = Provider<ProductRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(secureTokenStorageProvider);
  return ProductRemoteDataSourceImpl(
    client: client,
    tokenStorage: tokenStorage,
  );
});
