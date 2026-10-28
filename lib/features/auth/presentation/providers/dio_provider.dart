import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/core/network/interceptors/auth_interceptor.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/secure_token_storage_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final tokenStorage = ref.watch(secureTokenStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000',
      contentType: 'application/json',
      connectTimeout: const Duration(
        seconds: 10,
      ), // 10 seconds connection timeout
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  dio.interceptors.add(
    AuthInterceptor(
      tokenStorage: tokenStorage,
    ),
  );
  return dio;
});
