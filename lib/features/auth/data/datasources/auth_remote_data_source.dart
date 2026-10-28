import 'package:flutter_riverpod_pk/core/network/api_client.dart';
import 'package:flutter_riverpod_pk/core/network/api_endpoints.dart';
import 'package:flutter_riverpod_pk/core/storage/secure_token_storage.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>?> login(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;
  final SecureTokenStorage tokenStorage;

  AuthRemoteDataSourceImpl({
    required this.client,
    required this.tokenStorage,
  });

  @override
  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await client.post(
        ApiEndpoints.loginV2,
        data: {
          'email': email,
          'password': password,
        },
        requiresAuth: false,
      );

      return response.data;
    } catch (e) {
      print("e... $e");
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      await tokenStorage.clear();
    } catch (e) {
      print("Logout exception");
    }
  }
}
