import '../../domain/entities/user.dart';

abstract class FakeAuthDataSource {
  Future<User?> restoreSession();
  Future<User?> login(String email, String password);
  Future<void> logout();
}

class FakeAuthDataSourceImpl extends FakeAuthDataSource {
  @override
  Future<User?> restoreSession() async {
    return null;
  }

  @override
  Future<User?> login(String email, String password) async {
    return null;
  }

  @override
  Future<void> logout() async {}
}
