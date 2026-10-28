import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/secure_token_storage_provider.dart';

import '../../data/datasources/auth_remote_data_source.dart';
import 'api_client_provider.dart';

final authRemoteRepositoryProvider = Provider<AuthRemoteDataSource>((ref) {
  final client = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(secureTokenStorageProvider);
  return AuthRemoteDataSourceImpl(
    client: client,
    tokenStorage: tokenStorage,
  );
});
