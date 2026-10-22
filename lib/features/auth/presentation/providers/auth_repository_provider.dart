import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:flutter_riverpod_pk/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/repositories/auth_repository.dart';
// import 'package:flutter_riverpod_pk/app/providers/mode_provider.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/api_client_provider.dart';

// import 'fake_auth_repository_provider.dart';
// import 'remote_auth_repository_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  // final debug = ref.watch(modeProvider);
  // late final AuthRepository repository;

  // print("Auth repository called...");

  // if (debug) {
  //   repository = ref.watch(fakeAuthRepositoryProvider);
  //   print("Fake Auth Repository Was Called!");
  // } else {
  //   repository = ref.watch(remoteAuthRepositoryProvider);
  // }

  // return repository;
  final client = ref.watch(apiClientProvider);
  return AuthRepositoryImpl(
    remoteDataSource: AuthRemoteDataSourceImpl(
      client: client,
    ),
  );
});
