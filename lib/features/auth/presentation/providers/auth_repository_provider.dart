import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_riverpod_pk/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/api_client_provider.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/secure_token_storage_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final client = ref.watch(apiClientProvider);
  final tokenStorage = ref.watch(secureTokenStorageProvider);
  return AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(
      client: client,
    ),
    tokenStorage: tokenStorage,
  );
});
