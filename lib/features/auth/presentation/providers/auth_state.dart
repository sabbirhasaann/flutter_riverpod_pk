import '../../domain/entities/user.dart';

enum AuthStatus {
  restoring,
  authenticated,
  unAuthenticated,
}

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });
}
