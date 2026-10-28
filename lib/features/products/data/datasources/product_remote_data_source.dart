import 'package:flutter_riverpod_pk/core/network/api_client.dart';
import 'package:flutter_riverpod_pk/core/network/api_endpoints.dart';
import 'package:flutter_riverpod_pk/core/storage/secure_token_storage.dart';

abstract class ProductRemoteDataSource {
  Future<List<dynamic>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final SecureTokenStorage tokenStorage;
  final ApiClient client;
  ProductRemoteDataSourceImpl({
    required this.client,
    required this.tokenStorage,
  });

  @override
  Future<List<dynamic>> getProducts() async {
    try {
      final response = await client.get(
        ApiEndpoints.productList,
      );

      return response.data;
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
