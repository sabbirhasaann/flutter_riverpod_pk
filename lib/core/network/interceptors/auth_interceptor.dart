import 'package:dio/dio.dart';
import 'package:flutter_riverpod_pk/core/storage/secure_token_storage.dart';

class AuthInterceptor extends Interceptor {
  final SecureTokenStorage tokenStorage;
  static const String requiresAuthKey = 'requiresAuth';

  AuthInterceptor({
    required this.tokenStorage,
  });

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final requiresAuth = options.extra[requiresAuthKey] as bool? ?? true;

    final accessToken = await tokenStorage.getAccessToken();
    if (accessToken == null || accessToken.isEmpty) {
      handler.next(options);
      return;
    }

    print("auth interceptor called");
    options.headers['Authorization'] = 'Bearer $accessToken';
    handler.next(options);
  }
}
