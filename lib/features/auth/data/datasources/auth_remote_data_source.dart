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
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      final response1 = await client.get(
        ApiEndpoints.me,
        headers: {
          'authorization': 'Bearer ${response.data['access']}',
        },
      );

      return response1.data;
    } catch (e) {
      print("e... $e");
    }
    return null;
  }

  @override
  Future<void> logout() async {}
}
