import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/usecases/restore_session.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/logout_user.dart';

import 'auth_state.dart';
import 'login_user_provider.dart';
import 'logout_user_provider.dart';
import 'restore_session_provider.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final LoginUser _loginUser;
  late final LogoutUser _logoutUser;
  late final RestoreSession _restoreSession;

  @override
  AuthState build() {
    _loginUser = ref.watch(loginUserProvider);
    _logoutUser = ref.watch(logoutUserProvider);
    _restoreSession = ref.watch(restoreSessionProvider);

    return AuthState(
      status: AuthStatus.restoring,
    );
  }

  Future<void> restoreSession() async {
    state = AuthState(
      status: AuthStatus.restoring,
    );

    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    try {
      final user = await _restoreSession();
      if (user != null) {
        state = AuthState(
          status: AuthStatus.authenticated,
          user: user,
        );
      } else {
        state = AuthState(
          status: AuthStatus.unAuthenticated,
        );
      }
    } catch (e) {
      state = AuthState(
        status: AuthStatus.unAuthenticated,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final user = await _loginUser(email, password);

      if (user != null) {
        state = AuthState(
          status: AuthStatus.authenticated,
          user: user,
        );
      }
    } catch (e) {
      state = AuthState(
        status: AuthStatus.unAuthenticated,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );

    try {
      await _logoutUser();

      state = AuthState(
        status: AuthStatus.unAuthenticated,
      );
    } catch (e) {
      print("error:.. $e");
    }
  }
}
