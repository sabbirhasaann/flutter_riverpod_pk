import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class RestoreSession {
  final AuthRepository repository;
  RestoreSession(this.repository);

  Future<User?> call() {
    return repository.restoreSession();
  }
}
