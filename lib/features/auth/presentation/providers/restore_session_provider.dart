import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/features/auth/domain/usecases/restore_session.dart';
import 'package:flutter_riverpod_pk/features/auth/presentation/providers/auth_repository_provider.dart';

final restoreSessionProvider = Provider<RestoreSession>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RestoreSession(repository);
});
