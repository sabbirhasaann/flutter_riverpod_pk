import '../entities/user.dart';

abstract class AuthRepository {
  Future<User?> restoreSession();
  Future<User?> login(String email, String password);
  Future<void> logout();
}
