import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/counter_stream_provider.dart';

class CounterStreamPage extends ConsumerWidget {
  const CounterStreamPage({super.key});
  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Counter'),
      ),
      body: Center(
        child: counter.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) {
            return Text(
              'Error: $error',
            );
          },
          data: (value) {
            return Text(
              '$value',
              style: const TextStyle(
                fontSize: 48,
              ),
            );
          },
        ),
      ),
    );
  }
}
