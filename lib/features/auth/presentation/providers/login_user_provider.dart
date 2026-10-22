import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/usecases/login_user.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/auth_repository_provider.dart';

final loginUserProvider = Provider<LoginUser>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LoginUser(repository);
});
