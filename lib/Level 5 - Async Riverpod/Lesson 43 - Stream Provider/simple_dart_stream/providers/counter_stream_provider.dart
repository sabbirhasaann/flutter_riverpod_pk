import 'package:flutter_riverpod/flutter_riverpod.dart';

Stream<int> counterStream() async* {
  for (int i = 1; i <= 5; ++i) {
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );

    yield i;
  }
}

final counterProvider = StreamProvider<int>((ref) {
  return counterStream();
});
