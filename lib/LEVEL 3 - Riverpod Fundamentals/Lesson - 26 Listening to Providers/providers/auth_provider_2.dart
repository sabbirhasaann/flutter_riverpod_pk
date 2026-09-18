import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthState {
  isAuthenticated,
  authenticated,
}

final authProvider2 = Provider<AuthState>((ref) {
  ref.onDispose(() {
    print("Disposed provider 2...");
  });

  return AuthState.isAuthenticated;
});
