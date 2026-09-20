class ChatRepository {
  Stream<List<String>> watchMessages(int roomId) async* {
    yield ['Hello'];
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield [
      'Hello',
      'How are you?',
    ];
    await Future.delayed(
      const Duration(seconds: 1),
    );
    yield [
      'Hello',
      'How are you?',
      'I am fine!',
    ];
  }
}
