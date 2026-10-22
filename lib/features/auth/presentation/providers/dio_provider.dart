import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'http://127.0.0.1:8000',
      contentType: 'application/json',
      connectTimeout: const Duration(
        seconds: 10,
      ), // 10 seconds connection timeout
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
});
