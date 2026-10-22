import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/usecases/logout_user.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/auth_repository_provider.dart';

final logoutUserProvider = Provider<LogoutUser>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUser(repository);
});
