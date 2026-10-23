import 'package:flutter_riverpod_pk/features/auth/data/models/auth_response_model.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/entities/user.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<User?> restoreSession() async {
    return null;
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final data = await remoteDataSource.login(email, password);
      if (data != null) {
        final authResponse = AuthResponseModel.fromJson(data);
        return authResponse.user;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<void> logout() async {}
}
