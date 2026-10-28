import 'package:flutter_riverpod_pk/features/products/data/datasources/product_remote_data_source.dart';
import 'package:flutter_riverpod_pk/features/products/data/models/product_model.dart';

import '../../domain/repositories/product_repository.dart';
import '../../domain/entities/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  ProductRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    
    try {
      final data = await remoteDataSource.getProducts();
      
      final products = data.map((e) {
        return ProductModel.fromJson(e);
      }).toList();

      return products;
    } catch (e) {
      throw Exception("Exception.. $e");
    }
  }
}
