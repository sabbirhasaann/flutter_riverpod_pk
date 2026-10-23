import 'package:flutter_riverpod_pk/core/network/api_client.dart';
import 'package:flutter_riverpod_pk/core/network/api_endpoints.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>?> login(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSourceImpl({
    required this.client,
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
      );

      return response.data;
    } catch (e) {
      print("e... $e");
    }
    return null;
  }

  @override
  Future<void> logout() async {}
}
