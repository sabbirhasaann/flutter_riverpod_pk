import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/core/storage/secure_token_storage.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/flutter_secure_storage_provider.dart';

final secureTokenStorageProvider = Provider<SecureTokenStorage>((ref) {
  final storage = ref.watch(flutterSecureStorageProvider);
  return SecureTokenStorage(storage: storage);
});
