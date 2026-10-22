import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  ApiClient({
    required this.dio,
  });

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(
        headers: headers ?? null,
      ),
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    Object? data,
  }) {
    return dio.post(path, data: data);
  }

  Future<Response<T>> put<T>(
    String path, {
    Object? data,
  }) {
    return dio.put<T>(
      path,
      data: data,
    );
  }

  Future<Response<T>> delete<T>(
    String path,
  ) {
    return dio.delete<T>(path);
  }
}
