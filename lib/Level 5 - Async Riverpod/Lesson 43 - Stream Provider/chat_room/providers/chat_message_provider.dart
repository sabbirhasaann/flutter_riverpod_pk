import 'package:flutter_riverpod/flutter_riverpod.dart';
import './chat_repository_provider.dart';

final chatMessagesProvider = StreamProvider.family<List<String>, int>(
  (ref, roomId) {
    final repository = ref.watch(chatRepositoryProvider);
    return repository.watchMessages(roomId);
  },
);
