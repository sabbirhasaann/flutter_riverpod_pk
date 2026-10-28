import 'package:dio/dio.dart';
import 'package:flutter_riverpod_pk/core/network/interceptors/auth_interceptor.dart';

class ApiClient {
  final Dio dio;
  ApiClient({
    required this.dio,
  });

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? requiresAuth,
  }) {
    return dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        extra: {
          AuthInterceptor.requiresAuthKey: requiresAuth,
        },
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    bool? requiresAuth,
  }) {
    return dio.post(
      path,
      data: data,
      options: Options(
        extra: {
          AuthInterceptor.requiresAuthKey: requiresAuth,
        },
      ),
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
    bool? requiresAuth,
  }) {
    return dio.put<T>(
      path,
      data: data,
      options: Options(
        extra: {
          AuthInterceptor.requiresAuthKey: requiresAuth,
        },
      ),
    );
  }

  Future<Response<T>> delete<T>(
    String path,
    bool? requiresAuth,
  ) {
    return dio.delete<T>(
      path,
      options: Options(
        extra: {
          AuthInterceptor.requiresAuthKey: requiresAuth,
        },
      ),
    );
  }
}
